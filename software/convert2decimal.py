import re
import sys
import argparse
from decimal import Decimal, DivisionByZero, InvalidOperation

debug = False  # Set to True to enable debug output

def print_debug(message):
    if debug:
        print(message)

def fraction_to_decimal(frac_str):
    """
    Converts a fraction string from SMT-LIBv2 to a high-precision decimal float.
    Handles large numbers, fractions, and negative values.
    """
    print_debug(f"Debug: Processing fraction string: {frac_str}")

    # Step 1: Remove parentheses but leave spaces intact
    frac_str = frac_str.replace("(", "").replace(")", "")

    # if "to_real " is present, remove it
    if "to_real " in frac_str:
        frac_str = frac_str.replace("to_real ", "")

    # Step 2: Set flags based on the presence of '/' and '-'
    fraction_flag = '/' in frac_str
    minus_flag = '-' in frac_str

    # Step 3: Remove '/' or '-' for processing as needed
    if fraction_flag:
        frac_str = frac_str.replace("/", "", 1)
    if minus_flag:
        frac_str = frac_str.replace("-", "", 1)

    # Step 4: Process based on fraction_flag
    parts = frac_str.split()
    try:
        if fraction_flag and len(parts) == 2:  # Handle fractions
            numerator = Decimal(parts[0].strip())
            denominator = Decimal(parts[1].strip())
            out_number = numerator / denominator
            print_debug(f"Debug: Parsed as fraction: {numerator}/{denominator} = {out_number}")
        else:  # Handle single whole numbers or decimals
            out_number = Decimal(parts[0].strip())
            print_debug(f"Debug: Parsed as whole number or decimal: {out_number}")

        # Step 5: Apply minus_flag if set
        if minus_flag:
            out_number = -out_number
            print_debug(f"Debug: Applied minus, final output: {out_number}")

        return out_number

    except (ValueError, DivisionByZero, InvalidOperation) as e:
        print_debug(f"Debug: Error in conversion - {e}")
        return Decimal('NaN')


def parse_model_output(file_path, wb_only=False, convert_slack=False):
    model = {}
    try:
        with open(file_path, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: The file '{file_path}' does not exist.")
        sys.exit(1)

    if not lines or lines[0].strip() != 'sat':
        print("The SMT solver returned 'unsat' or an unexpected result.")
        sys.exit(1)

    print_debug("Debug: Start parsing model output")
    
    carry_over = False
    fun_statement = ""

    for line in lines[1:]:
        line = line.strip()
        print_debug(f"Debug: Processing line: {line}")

        # Handle multi-line `define-fun` statements in Z3
        if carry_over:
            fun_statement += " " + line
            if fun_statement.count('(') == fun_statement.count(')'):
                process_define_fun_statement(fun_statement, model, wb_only, convert_slack)
                carry_over = False
                fun_statement = ""
            continue

        # Start a new define-fun statement
        if "(define-fun" in line:
            fun_statement = line
            if line.endswith("Real"):
                carry_over = True
            else:
                process_define_fun_statement(fun_statement, model, wb_only, convert_slack)
                fun_statement = ""

    print_debug("Debug: Finished parsing model output")
    return model

def process_slack_variable(var_name, fraction_str, model):
    """
    Processes slack variables and adds them to the model.
    """
    # Convert the fraction part to decimal
    decimal_value = fraction_to_decimal(fraction_str)
    model[var_name] = decimal_value
    print_debug(f"Debug: Parsed slack variable - {var_name} = {decimal_value}")

def process_define_fun_statement(fun_statement, model, wb_only=False, convert_slack=False):
    # Extract the variable name and the fraction value using regex
    match = re.match(r'\(define-fun (\w+) \(\) Real (.+)\)', fun_statement)
    # if not floating point, try integer
    if not match:
        match = re.match(r'\(define-fun (\w+) \(\) Int (.+)\)', fun_statement)
    if not match:
        print_debug(f"Skipping line - did not match define-fun pattern: {fun_statement}")
        return

    if wb_only:
        # if not a weight or bias
        if not match.group(1).startswith('w') and not match.group(1).startswith('b'):
            if convert_slack:
                process_slack_variable(match.group(1), match.group(2), model)
            else:
                return
    
    var_name = match.group(1)
    fraction_str = match.group(2).strip()
    
    # Convert the fraction part to decimal
    decimal_value = fraction_to_decimal(fraction_str)
    model[var_name] = decimal_value
    print_debug(f"Debug: Parsed variable - {var_name} = {decimal_value}")

def print_model(model):
    """
    Prints the model's variable assignments in decimal format.
    """
    print("\nModel:")
    for var, value in model.items():
        print(f"{var} = {value}")

def main():
    parser = argparse.ArgumentParser(description='Convert SMT solver fractional outputs to decimals.')
    parser.add_argument('input_file', type=str, help='Path to the SMT solver output file (e.g., out1.txt)')
    parser.add_argument('--only_wt', action='store_true', help='Produce weight file with weights only (not intermediate nodes)')
    parser.add_argument('--convert_slack', action='store_true', help='Convert slack variables to decimal')
    args = parser.parse_args()
    
    model = parse_model_output(args.input_file, args.only_wt, args.convert_slack)
    if model:
        print_model(model)

if __name__ == "__main__":
    main()

