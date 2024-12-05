import pandas as pd
import argparse
import sys
import os

def read_training_data(file_path, skip_sample=0):
    """
    Reads the training data from an Excel spreadsheet.
    The first column is 'Guilt' (labels), and the rest are features.
    """
    try:
        ef = pd.read_excel(file_path)
        if skip_sample > 0:
            df = ef.drop(ef.index[skip_sample-1])
        else:
            df = ef
        return df
    except Exception as e:
        print(f"Error reading the training data: {e}")
        sys.exit(1)

def generate_smt2_file(df, output_file, num_samples=0, num_layers=2, nodes_per_layer=[5], use_relu=True):
    """
    Generates an SMT-LIBv2 file based on the training data with configurable layers.
    Parameters:
    - df: DataFrame containing the training data.
    - output_file: Name of the SMT-LIBv2 file to be generated.
    - num_samples: Number of samples to include in the SMT file. If = 0, then all samples are included.
    - num_layers: Number of hidden layers.
    - nodes_per_layer: List specifying the number of nodes in each hidden layer.
    - use_relu: Whether to use clipped ReLU activation in hidden layers.
    """
    # Extract labels and features
    labels = df.iloc[:, 0].tolist()       # First column: Guilt (0 or 1)
    feature_names = df.columns[1:]        # Remaining columns: Features
    features = df.iloc[:, 1:].values      # Feature values

    total_samples = len(labels)
    num_features = len(feature_names)

    # Limit the number of samples
    if num_samples == 0: # if unlimited samples
        num_samples = total_samples
    num_samples = min(num_samples, total_samples)
    labels = labels[:num_samples]
    features = features[:num_samples]

    # Start constructing the SMT-LIBv2 content
    smt_lines = []

    # Add SMT-LIBv2 configuration lines
    smt_lines.append("; SMT-LIBv2 configurations")
    smt_lines.append("(set-logic QF_NRA)")
    smt_lines.append("(set-option :produce-models true)")
    # smt_lines.append("(set-option :incremental true)")
    smt_lines.append("(set-option :produce-unsat-cores true)")
    # smt_lines.append("(set-option :print-cores-full true)")
    smt_lines.append("")  # Blank line for readability

    # Add a comment header
    smt_lines.append("; SMT-LIBv2 file generated for cvc5 with multi-layer configuration")
    if not use_relu and num_layers > 0:
        smt_lines.append("; ReLU activation is disabled in hidden layers")
    smt_lines.append(f"; Number of features (input neurons): {num_features}")
    smt_lines.append(f"; Number of layers: {num_layers}")
    if num_layers > 0:
        for l in range(num_layers):
            smt_lines.append(f"; Number of nodes in layer {l+1}: {nodes_per_layer[l]}")
    smt_lines.append(f"; Number of samples: {num_samples}")
    smt_lines.append("")

    if num_layers == 0:
        # Case with no hidden layers
        for i, feature in enumerate(feature_names, start=1):
            smt_lines.append(f"(declare-fun w{i} () Real) ; Weight for feature '{feature}'")
            smt_lines.append(f"(assert (and (>= w{i} -100.0) (<= w{i} 100.0)))")
        smt_lines.append("(declare-fun b () Real) ; Bias for output node")

        # Constraints for each sample
        for idx, (label, sample_features) in enumerate(zip(labels, features)):
            sample_constraint = f"(assert ({'>' if label == 1 else '<'} (+"
            for i, value in enumerate(sample_features):
                sample_constraint += f" (* w{i + 1} {value})"
            sample_constraint += f" b) 0.0)) ; Constraint for sample {idx + 1} (Label: {label})"
            smt_lines.append(sample_constraint)
        smt_lines.append("(check-sat)")
        smt_lines.append("(get-model)")

    else:
        # Case with hidden layers
        layer_sums = {}

        # Declare weights and biases for hidden layers
        for layer in range(1, num_layers + 1):
            num_nodes = nodes_per_layer[layer - 1]
            prev_layer_nodes = num_features if layer == 1 else nodes_per_layer[layer - 2]
            for node in range(1, num_nodes + 1):
                for input_node in range(1, prev_layer_nodes + 1):
                    weight_name = f"w{layer}_{node}_{input_node}"
                    smt_lines.append(f"(declare-fun {weight_name} () Real)")
                bias_name = f"b{layer}_{node}"
                smt_lines.append(f"(declare-fun {bias_name} () Real)")

                # If ReLU is enabled, declare separate variables for the unclipped and clipped node outputs
                if use_relu:
                    smt_lines.append(f"(declare-fun node_out_{layer}_{node} () Real)")
                    smt_lines.append(f"(declare-fun clipped_relu_out_{layer}_{node} () Real)")
                else:
                    # Only store the weighted sum for layers if ReLU is not used
                    layer_sums[(layer, node)] = f"node_out_{layer}_{node}"

        # Declare weights and bias for output layer
        output_layer = num_layers + 1
        for node in range(1, nodes_per_layer[-1] + 1):
            smt_lines.append(f"(declare-fun w{output_layer}_1_{node} () Real)")
        smt_lines.append("(declare-fun b_out () Real)")

        # Constraints for each sample
        for idx, (label, sample_features) in enumerate(zip(labels, features)):
            smt_lines.append(f"; Constraint for sample {idx+1} (Label: {label})")

            # Process hidden layers
            for layer in range(1, num_layers + 1):
                num_nodes = nodes_per_layer[layer - 1]
                prev_layer_outputs = sample_features if layer == 1 else [
                    layer_sums[(layer - 1, node)]
                    for node in range(1, nodes_per_layer[layer - 2] + 1)
                ]
                for node in range(1, num_nodes + 1):
                    weighted_sum = f"(+ {' '.join(f'(* w{layer}_{node}_{i+1} {prev_output})' for i, prev_output in enumerate(prev_layer_outputs))} b{layer}_{node})"
                    node_out_name = f"node_out_{layer}_{node}"

                    if use_relu:
                        # Separate the weighted sum and clipped ReLU activation in the assertions
                        smt_lines.append(f"(assert (= {node_out_name} {weighted_sum}))")
                        activation = f"(ite (> {node_out_name} 1) 1 (ite (<= {node_out_name} -1) -1 {node_out_name}))"
                        clipped_relu_out_name = f"clipped_relu_out_{layer}_{node}"
                        smt_lines.append(f"(assert (= {clipped_relu_out_name} {activation}))")
                        layer_sums[(layer, node)] = clipped_relu_out_name
                    else:
                        # Directly assign the weighted sum if ReLU is not used
                        layer_sums[(layer, node)] = weighted_sum

            # Output layer constraint based on label
            output_expression = f"(+ {' '.join(f'(* w{output_layer}_1_{node} {layer_sums[(num_layers, node)]})' for node in range(1, nodes_per_layer[-1] + 1))} b_out)"
            if label == 1:
                smt_lines.append(f"(assert (> {output_expression} 0))")
            else:
                smt_lines.append(f"(assert (< {output_expression} 0))")

        # Check satisfiability
        smt_lines.append("(check-sat)")
        smt_lines.append("(get-model)")

    # Write to the SMT-LIBv2 file
    try:
        with open(output_file, 'w') as f:
            f.write("\n".join(smt_lines))
        print(f"SMT-LIBv2 file '{output_file}' has been generated.")
    except Exception as e:
        print(f"Error writing to the SMT-LIBv2 file: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Generate SMT-LIBv2 file for multi-layer real-number classifier.')
    parser.add_argument('input_file', type=str, help='Path to the training data Excel file')
    parser.add_argument('output_file', type=str, help='Name of the SMT-LIBv2 output file')
    parser.add_argument('--num_samples', type=int, default=0, help='Number of training samples to include (default: 0 (all))')
    parser.add_argument('--num_layers', type=int, default=0, help='Number of hidden layers (default: 2)')
    parser.add_argument('--nodes_per_layer', type=int, nargs='+', default=[5], help='Nodes per hidden layer')
    parser.add_argument('--norelu', action='store_true', help='Disable ReLU activation in hidden layers') # set default to bypass ReLU activation
    parser.add_argument('--bypassrelu', action='store_true', help='Bypass ReLU activation for debugging')
    # parameter to skip a particular sample. If 0, no samples are skipped, default 0
    parser.add_argument('--skip_sample', type=int, default=0, help='Skip a particular sample')
    args = parser.parse_args()

    # Read the training data
    df = read_training_data(args.input_file, args.skip_sample)

    # Generate the SMT-LIBv2 file with the specified parameters
    generate_smt2_file(df, args.output_file, args.num_samples, args.num_layers, args.nodes_per_layer, use_relu=not args.norelu)