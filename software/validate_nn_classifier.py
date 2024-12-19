import argparse
import pandas as pd
import csv

def load_weights(weights_bias_file):
    """
    Loads weights and biases from a file of the format:
    w{layer}_{node}_{input} = value
    b{layer}_{node} = value

    For a single hidden layer (layer 1) and output layer (layer 2):

    Returns:
    weights: dict of {layer: {node: {input: value}}}
    biases: dict of {layer: {node: value}}
    layer_count: number of layers (not counting input)
    """
    weights = {}
    biases = {}

    with open(weights_bias_file, 'r') as f:
        for line in f:
            line=line.strip()
            if '=' not in line or line.startswith("Model"):
                continue
            left, right = line.split('=')
            left = left.strip()
            right = right.strip()

            if left.startswith('w'):
                # Format: w{layer}_{node}_{input}
                # Example: w1_3_2 means layer 1, node 3, input 2
                parts = left.split('_')
                # parts[0]: w1 (layer), parts[1]: node, parts[2]: input
                layer = parts[0][1:]  # remove 'w'
                node = parts[1]
                input_node = parts[2]

                if layer not in weights:
                    weights[layer] = {}
                if node not in weights[layer]:
                    weights[layer][node] = {}
                weights[layer][node][input_node] = float(right)

            elif left.startswith('b'):
                # Format: b{layer}_{node}
                parts = left.split('_')
                # parts[0]: b1 (layer), parts[1]: node
                layer = parts[0][1:]  # remove 'b'
                node = parts[1]

                if layer not in biases:
                    biases[layer] = {}
                biases[layer][node] = float(right)

    # Determine layer count
    # Layers are keys in weights/biases; assume consecutive layer numbering
    layers = set()
    for l in weights.keys():
        layers.add(int(l))
    for l in biases.keys():
        layers.add(int(l))
    layer_count = len(layers)  # Should be 2 (1 hidden, 1 output layer)

    return weights, biases, layer_count

def forward_pass(weights, biases, features):
    """
    Forward pass with threshold activation:
    1) Compute hidden layer: Z = XW1 + b1
       threshold: if Z>=0 =>1 else 0
    2) Compute output: Y_pred = ZW2 + b2
       threshold: if Y_pred>=0 =>1 else 0
    """

    # Convert weights/biases into a usable format
    # Layer 1
    W1, b1 = extract_layer_params(weights, biases, layer='1')
    # W1 shape: (n_inputs, n_hidden), b1 shape: (n_hidden,)

    # Hidden layer computation
    Z = []
    for h in range(b1.shape[0]):
        # weighted sum for node h: sum_over_inputs(W1[i,h]*x[i]) + b1[h]
        val = sum(W1[i][h]*features[i] for i in range(len(features))) + b1[h]
        print(f"Hidden neuron {h+1} input: {val}")
        Z.append(1.0 if val>=0 else 0.0)
        print(f"Hidden neuron {h+1} output (Z): {Z[-1]}")

    # Output layer
    W2, b2 = extract_layer_params(weights, biases, layer='2')
    # W2 shape: (n_hidden, 1), b2 shape: (1,)

    val = sum(W2[i][0]*Z[i] for i in range(len(Z))) + b2[0]
    print(f"Output neuron input: {val}")
    output = 1.0 if val>=0 else 0.0
    print(f"Output neuron output: {output}")

    return output

def extract_layer_params(weights, biases, layer):
    """
    Extracts W and b for a given layer.
    For layer L:
      weights[L] = {node: {input: value}}
      biases[L] = {node: value}

    Need to form a consistent ordering of nodes and inputs.
    We'll assume nodes and inputs are numbered starting from 1 and continuous.
    """
    layer_w = weights[layer]
    layer_b = biases[layer]

    # Determine number of nodes and inputs
    node_ids = sorted(int(n) for n in layer_w.keys())
    # For inputs, pick the first node and see its inputs
    some_node = str(node_ids[0])
    input_ids = sorted(int(i) for i in layer_w[some_node].keys())

    W = []
    for i_id in input_ids:
        row = []
        for n_id in node_ids:
            row.append(layer_w[str(n_id)][str(i_id)])
        W.append(row)
    # W currently shape: (n_inputs, n_nodes)
    # Convert to a more standard format (no real need if we are consistent)
    import numpy as np
    W = np.array(W)  # shape (n_inputs, n_nodes)

    b = []
    for n_id in node_ids:
        b.append(layer_b[str(n_id)])
    b = np.array(b)  # shape (n_nodes,)

    return W, b

def main():
    parser = argparse.ArgumentParser(description='Validate a single-hidden-layer neural network.')
    parser.add_argument('validation_data_file', type=str, help='Path to the validation data Excel file')
    parser.add_argument('weights_bias_file', type=str, help='Path to the weights and bias file')
    parser.add_argument('output_file', type=str, help='Path to the output CSV file')
    parser.add_argument('--num_samples', type=int, default=0, help='Number of samples to validate (default: 0 = all)')

    args = parser.parse_args()

    # Load weights and biases
    weights, biases, layer_count = load_weights(args.weights_bias_file)

    # Load validation data
    df = pd.read_excel(args.validation_data_file)
    if args.num_samples > 0:
        df = df.head(args.num_samples)

    y = df.iloc[:, 0].values
    X = df.iloc[:, 1:].values

    # Perform predictions
    predictions = []
    correct = 0

    for actual_label, features in zip(y, X):
        print(f"Input features: {features}, Actual label: {actual_label}")
        pred = forward_pass(weights, biases, features)
        predictions.append((actual_label, pred))
        if actual_label == pred:
            correct += 1

    accuracy = (correct / len(predictions)) * 100 if len(predictions)>0 else 0.0

    # Write output
    # Include simple topology info:
    # Determine topology from weights: 
    # Layer 1: number of nodes = len of biases['1']
    # Inputs = number of inputs from weights layer 1
    # Layer 2: single output node
    n_hidden = len(biases['1'])
    n_input = len(weights['1'][list(weights['1'].keys())[0]])  # inputs count from one hidden node definition

    with open(args.output_file, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(["Network Topology:"])
        writer.writerow([f"Input Layer: {n_input} inputs"])
        writer.writerow([f"Layer 1: {n_hidden} neurons"])
        writer.writerow([f"Output Layer: 1 neuron"])
        writer.writerow(["Threshold Activation: Enabled"])
        writer.writerow([])
        writer.writerow(["Actual Label", "Predicted Label"])
        for a, p in predictions:
            writer.writerow([a, p])
        writer.writerow([])
        writer.writerow(["Accuracy", f"{accuracy:.2f}%"])

    print(f"Validation results written to {args.output_file} with accuracy {accuracy:.2f}%")

if __name__ == "__main__":
    main()
