import argparse
import pandas as pd
from sklearn.neural_network import MLPClassifier

def main():
    parser = argparse.ArgumentParser(description='Train a single-hidden-layer neural network classifier.')
    parser.add_argument('input_file', type=str, help='Path to the training data Excel file')
    parser.add_argument('output_file', type=str, help='Path to the output .txt file for weights and biases')
    parser.add_argument('--num_samples', type=int, default=0, help='Number of samples to use (default: 0 for all samples)')
    parser.add_argument('--nodes_per_layer', type=int, default=[5], help='Nodes in the hidden layer (default: 5)')

    args = parser.parse_args()

    # Load the training data
    df = pd.read_excel(args.input_file)
    if args.num_samples > 0:
        df = df.head(args.num_samples)

    # First column is the label
    y = df.iloc[:, 0].values
    X = df.iloc[:, 1:].values

    # Create and train MLP with a single hidden layer as defined
    # We'll use 'identity' activation for a linear output during training
    # We will apply threshold ourselves after training.
    hidden_layer_sizes = (args.nodes_per_layer,)
    clf = MLPClassifier(hidden_layer_sizes=hidden_layer_sizes, activation='identity', max_iter=1000, random_state=42)
    clf.fit(X, y)

    # Extract weights and biases
    # coefs_ is a list: coefs_[0] shape: (n_inputs, n_hidden)
    # intercepts_[0] shape: (n_hidden,)
    # coefs_[1] shape: (n_hidden, 1)
    # intercepts_[1] shape: (1,)
    coefs = clf.coefs_
    intercepts = clf.intercepts_

    # Write weights and biases in the required format
    # Hidden layer is layer 1, output layer is layer 2

    with open(args.output_file, 'w') as f:
        f.write("Model:\n")

        # Layer 1 weights: w1_{node}_{input}, b1_{node}
        # coefs_[0]: shape (n_inputs, n_hidden)
        # intercepts_[0]: shape (n_hidden,)
        n_inputs = coefs[0].shape[0]
        n_hidden = coefs[0].shape[1]
        for h_node in range(1, n_hidden+1):
            # Weights from input nodes to this hidden node
            for i in range(1, n_inputs+1):
                val = coefs[0][i-1, h_node-1]
                f.write(f"w1_{h_node}_{i} = {val}\n")
            # Bias for this hidden node
            b_val = intercepts[0][h_node-1]
            f.write(f"b1_{h_node} = {b_val}\n")

        # Layer 2 weights: w2_{1}_{hidden_node}, b2_{1}
        # coefs_[1]: shape (n_hidden, 1)
        # intercepts_[1]: shape (1,)
        for h_node in range(1, n_hidden+1):
            val = coefs[1][h_node-1, 0]
            f.write(f"w2_1_{h_node} = {val}\n")

        b_val = intercepts[1][0]
        f.write(f"b2_1 = {b_val}\n")

    print(f"Weights and biases saved to {args.output_file}")

if __name__ == "__main__":
    main()
