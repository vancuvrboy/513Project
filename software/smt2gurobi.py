import re
import argparse
from gurobipy import Model, GRB

def tokenize_s_expression(s):
    s = s.strip()
    # Insert spaces around parentheses
    s = s.replace('(', ' ( ').replace(')', ' ) ')
    tokens = s.split()
    return tokens

def parse_tokens(tokens):
    if len(tokens) == 0:
        raise ValueError("Unexpected end of tokens")
    token = tokens.pop(0)
    if token == '(':
        expr = []
        while tokens[0] != ')':
            expr.append(parse_tokens(tokens))
        tokens.pop(0)  # remove ')'
        return expr
    elif token == ')':
        raise ValueError("Unexpected )")
    else:
        return token

def parse_s_expression(s):
    tokens = tokenize_s_expression(s)
    expr = parse_tokens(tokens)
    if len(tokens) != 0:
        raise ValueError("Extra tokens after parsing expression")
    return expr

def parse_smt_file(filename):
    unsupported_constructs = []
    variables = {}
    constraints = []
    objective = None

    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if not line:
                continue

            if line.startswith('(declare-fun'):
                try:
                    expr = parse_s_expression(line)
                    # Expected: ['declare-fun', var_name, [], 'Real']
                    if (len(expr) == 4 and expr[0] == 'declare-fun' and
                        expr[2] == [] and expr[3] == 'Real'):
                        var_name = expr[1]
                        variables[var_name] = {'type': 'Real'}
                    else:
                        unsupported_constructs.append(line)
                except Exception:
                    unsupported_constructs.append(line)

            elif line.startswith('(assert'):
                try:
                    expr = parse_s_expression(line)
                    # Expected: ['assert', (...constraint...)]
                    if len(expr) == 2 and expr[0] == 'assert':
                        constraints.append(expr[1])
                    else:
                        unsupported_constructs.append(line)
                except Exception:
                    unsupported_constructs.append(line)

            elif line.startswith('(minimize') or line.startswith('(maximize'):
                try:
                    expr = parse_s_expression(line)
                    if expr[0] in ['minimize', 'maximize']:
                        objective = expr
                    else:
                        unsupported_constructs.append(line)
                except Exception:
                    unsupported_constructs.append(line)
            else:
                unsupported_constructs.append(line)

    return variables, constraints, objective, unsupported_constructs

def is_variable(token, gurobi_vars):
    return isinstance(token, str) and token in gurobi_vars

def translate_expr_to_python(expr, gurobi_vars):
    if isinstance(expr, str):
        # Variable or number
        if expr in gurobi_vars:
            return f"gurobi_vars['{expr}']"
        else:
            # Try float
            try:
                float_val = float(expr)
                return str(float_val)
            except ValueError:
                raise ValueError(f"Unsupported symbol: {expr}")

    if not expr:
        raise ValueError("Empty expression")

    op = expr[0]

    # Convert strict inequalities
    if op == '>':
        op = '>='
    elif op == '<':
        op = '<='

    # Comparison operators
    if op in ['=', '>=', '<=', '==']:
        if op == '=':
            op = '=='
        if len(expr) != 3:
            raise ValueError(f"Comparison operator {op} requires two arguments")
        left = translate_expr_to_python(expr[1], gurobi_vars)
        right = translate_expr_to_python(expr[2], gurobi_vars)
        return f"({left} {op} {right})"

    # Arithmetic operators
    elif op in ['+', '*', '-']:
        if len(expr) < 2:
            raise ValueError(f"Operator {op} requires arguments")

        translated_args = [translate_expr_to_python(e, gurobi_vars) for e in expr[1:]]

        # Check non-linearity for '*'
        if op == '*':
            # Check if we have more than one variable
            gurobi_var_args = [arg for arg in translated_args if "gurobi_vars['" in arg]
            if len(gurobi_var_args) > 1:
                # Multiplication of two variables => non-linear
                raise ValueError(f"Non-linear term detected: multiplication of variables {translated_args}")

        if op == '+':
            return "(" + " + ".join(translated_args) + ")"
        elif op == '*':
            return "(" + " * ".join(translated_args) + ")"
        elif op == '-':
            if len(translated_args) == 1:
                return f"(-{translated_args[0]})"
            else:
                return "(" + " - ".join(translated_args) + ")"
    else:
        raise ValueError(f"Unsupported operator or form: {op}")

def translate_to_gurobi(variables, constraints, objective):
    model = Model('SMT_to_Gurobi')

    # Add variables
    gurobi_vars = {}
    for var_name in variables:
        gurobi_vars[var_name] = model.addVar(name=var_name, vtype=GRB.CONTINUOUS)
    model.update()

    # Add constraints
    for constraint_expr in constraints:
        try:
            py_expr = translate_expr_to_python(constraint_expr, gurobi_vars)
            # Debug print to see what we're evaluating
            print("Evaluating constraint:", py_expr)
            c = eval(py_expr, {"gurobi_vars": gurobi_vars}, {})
            # Now just add the constraint directly
            model.addConstr(c)
        except Exception as e:
            print(f"Could not translate constraint: {constraint_expr}. Error: {e}")

    # Add objective
    if objective:
        try:
            direction = objective[0]
            obj_expr = objective[1] if len(objective) > 1 else None
            if obj_expr is None:
                raise ValueError("Objective expression missing")

            py_expr = translate_expr_to_python(obj_expr, gurobi_vars)
            print("Evaluating objective:", py_expr)
            obj = eval(py_expr, {"gurobi_vars": gurobi_vars}, {})

            if direction == 'minimize':
                model.setObjective(obj, GRB.MINIMIZE)
            elif direction == 'maximize':
                model.setObjective(obj, GRB.MAXIMIZE)
            else:
                raise ValueError(f"Unknown objective direction: {direction}")

        except Exception as e:
            print(f"Could not translate objective: {objective}. Error: {e}")

    return model

def main():
    parser = argparse.ArgumentParser(description="Translate SMT-LIBv2 to Gurobi-compatible format.")
    parser.add_argument('smt_file', type=str, help="Path to the SMT-LIBv2 file")
    args = parser.parse_args()

    variables, constraints, objective, unsupported_constructs = parse_smt_file(args.smt_file)

    if unsupported_constructs:
        print("Unsupported constructs detected:")
        for construct in unsupported_constructs:
            print(construct)

    try:
        model = translate_to_gurobi(variables, constraints, objective)
        model.write('output.lp')
        print("Translation successful. Model saved as 'output.lp'.")
    except Exception as e:
        print(f"Error during translation: {e}")

if __name__ == '__main__':
    main()
