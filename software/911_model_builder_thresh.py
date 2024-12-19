import pandas as pd
import argparse
import sys

def format_decimal(value):
    if value == 0:
        return "0.0"  # Special case for zero
    elif abs(value) >= 1:
        return f"{value:.6f}".rstrip("0").rstrip(".")  # Strip trailing zeros and decimal
    else:
        # Count significant digits for small numbers
        return f"{value:.{abs(int(f'{value:.15e}'.split('e')[-1])) + 1}f}".rstrip("0").rstrip(".")

def smt_format(value):
    # if {value} is a negative number it needs to be expressed as "(- |{value}|)"
    if value < 0:
        return f"(- {abs(value)})"
    else:
        return f"{value}"

def read_training_data(file_path, skip_sample=0):
    try:
        df = pd.read_excel(file_path)
        if skip_sample > 0:
            df = df.drop(df.index[skip_sample-1])
        return df
    except Exception as e:
        print(f"Error reading the training data: {e}")
        sys.exit(1)

def generate_smt2_file(df, output_file, num_samples=0, num_layers=1, nodes_per_layer=[4], use_thresh=True, int_processing=False, wt_lim=False, min_err=False):
    labels = df.iloc[:, 0].tolist()
    feature_names = df.columns[1:]
    features = df.iloc[:, 1:].values

    total_samples = len(labels)
    num_features = len(feature_names)

    if num_layers != len(nodes_per_layer):
        print("Error: The number of layers must match the length of nodes_per_layer list.")
        sys.exit(1)

    if num_samples == 0:
        num_samples = total_samples
    num_samples = min(num_samples, total_samples)
    labels = labels[:num_samples]
    features = features[:num_samples]

    smt_lines = []
    smt_lines.append("; SMT-LIBv2 configurations")
    smt_lines.append("(set-logic QF_NRA)" if not int_processing else "(set-logic QF_NIA)")
    smt_lines.append("(set-option :produce-models true)")
    smt_lines.append("(set-option :produce-unsat-cores true)")
    smt_lines.append("")

    smt_lines.append("; SMT-LIBv2 file generated for cvc5 with multi-layer configuration")
    if not use_thresh and num_layers > 0:
        smt_lines.append("; Stepped threshold activation is disabled in hidden layers")
    elif use_thresh and num_layers > 0:
        smt_lines.append("; Stepped threshold activation is enabled in hidden layers")
    smt_lines.append(f"; Number of features (input neurons): {num_features}")
    smt_lines.append(f"; Number of layers: {num_layers}")
    if num_layers > 0:
        for l in range(num_layers):
            smt_lines.append(f"; Number of nodes in layer {l+1}: {nodes_per_layer[l]}")
    smt_lines.append(f"; Number of samples: {num_samples}")
    smt_lines.append("")

    # Declare weights and biases
    for layer in range(1, num_layers + 1):
        num_nodes = nodes_per_layer[layer - 1]
        prev_layer_nodes = num_features if layer == 1 else nodes_per_layer[layer - 2]
        for node in range(1, num_nodes + 1):
            for input_node in range(1, prev_layer_nodes + 1):
                weight_name = f"w{layer}_{node}_{input_node}"
                smt_lines.append(f"(declare-fun {weight_name} () Real) ; Weight for layer {layer}, node {node}, input {input_node}")
                # ensure the weight stays in a reasonable range
                if wt_lim:
                    smt_lines.append(f"(assert (or (and (> {weight_name} 0.1) (< {weight_name} 100)) (and (> {weight_name} (- 100.0)) (< {weight_name} (- 0.1)))))")
            bias_name = f"b{layer}_{node}"
            smt_lines.append(f"(declare-fun {bias_name} () Real) ; Bias for layer {layer}, node {node}")
            # ensure the bias stays in a reasonable range
            if wt_lim:
                smt_lines.append(f"(assert (or (and (> {bias_name} 0.1) (< {bias_name} 100)) (and (> {bias_name} (- 100.0)) (< {bias_name} (- 0.1)))))")
            if use_thresh:
                for sample_id in range(1, num_samples + 1):
                    z_name = f"z{layer}_{node}_s{sample_id}"
                    smt_lines.append(f"(declare-fun {z_name} () Bool) ; Binary activation for layer {layer}, node {node}, sample {sample_id}")
    smt_lines.append("")

    if use_thresh:
        for layer in range(1, num_layers + 1):
            num_nodes = nodes_per_layer[layer - 1]
            for node in range(1, num_nodes + 1):
                for sample_id in range(1, num_samples + 1):
                    node_out_name = f"node_out_{layer}_{node}_s{sample_id}"
                    smt_lines.append(f"(declare-fun {node_out_name} () Real) ; Intermediate output for layer {layer}, node {node}, sample {sample_id}")
        smt_lines.append("")

    # Declare output layer weights and bias
    output_layer = num_layers + 1
    for hidden_node in range(1, nodes_per_layer[-1] + 1):
        weight_name = f"w{output_layer}_1_{hidden_node}"
        smt_lines.append(f"(declare-fun {weight_name} () Real) ; Weight for output node, input from hidden node {hidden_node}")
        # ensure the weight stays in a reasonable range
        if wt_lim:
            smt_lines.append(f"(assert (or (and (> {weight_name} 0.1) (< {weight_name} 100)) (and (> {weight_name} (- 100.0)) (< {weight_name} (- 0.1)))))")
    smt_lines.append("(declare-fun b_out () Real) ; Bias for output node")
    # ensure the bias stays in a reasonable range
    if wt_lim:
        smt_lines.append(f"(assert (or (and (> b_out 0.1) (< b_out 100)) (and (> b_out (- 100.0)) (< b_out (- 0.1)))))")
    smt_lines.append("")

    # Generate constraints
    for sample_id, (label, sample_features) in enumerate(zip(labels, features), start=1):
        smt_lines.append(f"; Constraint for sample {sample_id} (Label: {label})")

        if use_thresh:
            sample_layer_outputs = {}
            for layer in range(1, num_layers + 1):
                num_nodes = nodes_per_layer[layer - 1]
                prev_layer_nodes = num_features if layer == 1 else nodes_per_layer[layer - 2]
                for node in range(1, num_nodes + 1):
                    weighted_sum_terms = []
                    for input_node in range(1, prev_layer_nodes + 1):
                        weight = f"w{layer}_{node}_{input_node}"
                        if layer == 1:
                            feature_value = sample_features[input_node - 1]
                            weighted_sum_terms.append(f"(* {weight} {smt_format(feature_value)})")
                        else:
                            prev_output = sample_layer_outputs[(layer - 1, input_node)]
                            weighted_sum_terms.append(f"(* {weight} {smt_format(prev_output)})")
                    weighted_sum = f"(+ {' '.join(weighted_sum_terms)} {f'b{layer}_{node}'})"
                    node_out_name = f"node_out_{layer}_{node}_s{sample_id}"
                    smt_lines.append(f"(assert (= {node_out_name} {weighted_sum}))")
                    
                    
                    z_name = f"z{layer}_{node}_s{sample_id}"
                    smt_lines.append(f"(assert (or (and (>= {node_out_name} 0) (= {z_name} true)) "
                                     f"(and (< {node_out_name} 0) (= {z_name} false))))")
                    
                    
                    activated_output = f"(ite {z_name} 1.0 0.0)"
                    sample_layer_outputs[(layer, node)] = activated_output

            # Compute output neuron expression
            output_terms = []
            for hidden_node in range(1, nodes_per_layer[-1] + 1):
                weight = f"w{output_layer}_1_{hidden_node}"
                hidden_output = sample_layer_outputs[(num_layers, hidden_node)]
                output_terms.append(f"(* {weight} {hidden_output})")
            output_expression = f"(+ {' '.join(output_terms)} {f'b_out'})"

            if min_err:
                smt_lines.append(f"(declare-fun err_s{sample_id} () Real) ; Error for sample {sample_id}")
                # decalre output node output_s# as a real number
                smt_lines.append(f"(declare-fun output_s{sample_id} () Real) ; Output for sample {sample_id}")
                smt_lines.append(f"(assert (= output_s{sample_id} {output_expression}))")
                # define error as the amount output is above 0
                # we are going to use -1.0 to generate the loss function if the label is 0
                # and 1.0 if the label is 1
                if label == 1:
                    smt_lines.append(f"(assert (= err_s{sample_id} (ite (< output_s{sample_id} 1.0) (- 1.0 output_s{sample_id}) 0.0)))")
                else:
                    smt_lines.append(f"(assert (= err_s{sample_id} (ite (> output_s{sample_id} (- 1.0)) (+ 1.0 output_s{sample_id}) 0.0)))")
            else:
            # Assert output constraint based on label
                if label == 1:
                    smt_lines.append(f"(assert (> {output_expression} 0)) ; Label 1 requires output > 0")
                else:
                    smt_lines.append(f"(assert (< {output_expression} 0)) ; Label 0 requires output < 0")
                smt_lines.append("")

        else:
            # Inline weighted sums directly into output constraints
            hidden_layer_expressions = []
            for layer in range(1, num_layers + 1):
                num_nodes = nodes_per_layer[layer - 1]
                for node in range(1, num_nodes + 1):
                    weighted_sum_terms = []
                    for input_node in range(1, num_features + 1):
                        weight = f"w{layer}_{node}_{input_node}"
                        feature_value = sample_features[input_node - 1]
                        weighted_sum_terms.append(f"(* {weight} {feature_value})")
                    weighted_sum = f"(+ {' '.join(weighted_sum_terms)} {f'b{layer}_{node}'})"
                    hidden_layer_expressions.append(weighted_sum)
            
            # Compute output expression
            output_terms = []
            for node, hidden_expr in enumerate(hidden_layer_expressions, start=1):
                weight = f"w{output_layer}_1_{node}"
                output_terms.append(f"(* {weight} {hidden_expr})")
            output_expression = f"(+ {' '.join(output_terms)} {f'b_out'})"
            
            # Assert output constraint based on label
            if label == 1:
                smt_lines.append(f"(assert (> {output_expression} 0)) ; Label 1 requires output > 0")
            else:
                smt_lines.append(f"(assert (< {output_expression} 0)) ; Label 0 requires output < 0")
            smt_lines.append("")


    if min_err:
        err_sum = " ".join([f"err_s{i+1}" for i in range(num_samples)])
        smt_lines.append(f"(minimize ( + {err_sum}))")
    smt_lines.append("(check-sat)")
    smt_lines.append("(get-model)")

    try:
        with open(output_file, 'w') as f:
            f.write("\n".join(smt_lines))
        print(f"SMT-LIBv2 file '{output_file}' has been generated successfully.")
    except Exception as e:
        print(f"Error writing to the SMT-LIBv2 file: {e}")
        sys.exit(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Generate SMT-LIBv2 file for multi-layer real-number or int classifier.')
    parser.add_argument('input_file', type=str, help='Path to the training data Excel file')
    parser.add_argument('output_file', type=str, help='Name of the SMT-LIBv2 output file')
    parser.add_argument('--num_samples', type=int, default=0, help='Number of training samples to include (default: 0 (all))')
    parser.add_argument('--num_layers', type=int, default=1, help='Number of hidden layers (default: 1)')
    parser.add_argument('--nodes_per_layer', type=int, nargs='+', default=[4], help='Nodes per hidden layer (default: [4])')
    parser.add_argument('--nothresh', action='store_true', help='Disable stepped threshold activation in hidden layers')
    parser.add_argument('--bypassrelu', action='store_true', help='Bypass ReLU activation for debugging')
    parser.add_argument('--skip_sample', type=int, default=0, help='Skip a particular sample (default: 0)')
    parser.add_argument('--int', action='store_true', help='Produce SMT-LIBv2 file for integer processing')
    parser.add_argument('--weight_lim', action='store_true', help='Produce SMT-LIBv2 file taht limits the range of weight values')
    parser.add_argument('--min', action='store_true', help='enable weight error minimization in threshold output')
    args = parser.parse_args()

    if len(args.nodes_per_layer) != args.num_layers and args.num_layers > 0:
        print("Error: The number of elements in nodes_per_layer must match num_layers.")
        sys.exit(1)

    df = read_training_data(args.input_file, args.skip_sample)

    generate_smt2_file(
        df,
        args.output_file,
        num_samples=args.num_samples,
        num_layers=args.num_layers,
        nodes_per_layer=args.nodes_per_layer,
        use_thresh=not args.nothresh,
        int_processing=args.int,
        wt_lim=args.weight_lim,
        min_err=args.min
    )
