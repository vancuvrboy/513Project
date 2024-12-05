import pandas as pd
import csv
import argparse
import math

debug = True  # Set to True to enable debug output

def print_debug(message):
    if debug:
        print(message)

def load_weights(weights_bias_file):
    weights = {}  # Dictionary for weights
    biases = {}   # Dictionary for biases
    single_layer_detected = True  # Assume single-layer until multi-layer format is found

    with open(weights_bias_file, 'r') as file:
        for line in file:
            parts = line.split("=")
            if len(parts) != 2:
                continue  # Skip lines that don't match the expected format
            
            name = parts[0].strip()
            value_str = parts[1].strip().replace("(- ", "-").replace("(", "").replace(")", "")
            value = float(value_str)

            if name.startswith("w"):
                name_parts = name.split("_")
                
                # Detect single-layer format (w{index})
                if len(name_parts) == 1 and name[1:].isdigit():
                    index = name[1:]  # Extracts index from "w{index}"
                    if '1' not in weights:
                        weights['1'] = {}  # Add a pseudo-layer '1' for consistency
                    if '1' not in weights['1']:
                        weights['1']['1'] = {}  # Create a single output node

                    # Assign each weight as a connection to the single output node
                    weights['1']['1'][index] = value

                # Detect multi-layer format (w{layer}_{node}_{input_node})
                elif len(name_parts) == 3:
                    single_layer_detected = False  # Switch to multi-layer detection
                    layer = name_parts[0][1]  # Extract layer from 'w{layer}'
                    node, input_node = name_parts[1], name_parts[2]
                    
                    # Initialize layer and node if they don't exist
                    if layer not in weights:
                        weights[layer] = {}
                    if node not in weights[layer]:
                        weights[layer][node] = {}
                    
                    # Assign value to the appropriate location
                    weights[layer][node][input_node] = value
                else:
                    print(f"Unexpected weight format: {name}")

            elif name.startswith("b"):
                name_parts = name.split("_")

                # Detect single-layer bias (b) or b_out
                if name == "b":
                    if '1' not in biases:
                        biases['1'] = {}
                    biases['1']['1'] = value  # Single output neuron bias
                
                elif name == "b_out":
                    # Store b_out separately for the output layer
                    biases['output'] = {'1': value}

                # Detect multi-layer format (b{layer}_{node})
                elif len(name_parts) == 2:
                    layer = name_parts[0][1]  # Extract layer from 'b{layer}'
                    node = name_parts[1]
                    
                    # Initialize layer if it doesn't exist
                    if layer not in biases:
                        biases[layer] = {}
                    
                    # Assign bias value
                    biases[layer][node] = value
                else:
                    print(f"Unexpected bias format: {name}")

    return weights, biases, single_layer_detected






def sigmoid(x):
    """ Sigmoid activation function """
    return 1 / (1 + math.exp(-x))


def forward_pass(weights, biases, features, use_sigmoid=True):
    """
    Runs a forward pass through the neural network dynamically.
    Returns 1 if the output >= 0.5 (indicating 'guilty'), otherwise 0 ('innocent').
    """
    # Initialize input as the feature set
    inputs = features

    # Iterate through each layer
    layer_index = 1
    while str(layer_index) in weights:
        next_inputs = []
        
        # Process each neuron in the current layer
        for node in sorted(weights[str(layer_index)].keys(), key=int):
            weighted_sum = sum(weights[str(layer_index)][node].get(str(i+1), 0) * inputs[i] for i in range(len(inputs)))
            # Retrieve the bias for the current node; default to 0 if missing
            weighted_sum += biases.get(str(layer_index), {}).get(node, 0)
            if use_sigmoid:
                next_inputs.append(sigmoid(weighted_sum))
            else:
                next_inputs.append(weighted_sum)
            print_debug(f"Layer {layer_index} Node {node} Weighted Sum: {weighted_sum}")
        
        # Set inputs for the next layer
        inputs = next_inputs
        layer_index += 1

    # Final output decision with the output bias (b_out) explicitly added if present
    output = inputs[0] + biases.get('output', {}).get('1', 0)  # Use b_out from 'output' section as the bias for the last layer
    return 1 if output >= 0.0 else 0

def determine_topology(weights, use_sigmoid, single_layer_detected):
    """
    Determines the topology of the network by examining the weights dictionary.
    Returns a list where each entry is the number of neurons in each layer,
    as well as whether sigmoid activation is used.
    """
    topology = []

    # Check if it's a single-layer structure (flat weights)
    if single_layer_detected:
        input_count = len(weights['1']['1'])  # Count all entries as input weights to a single output
        topology.append(f"Input Layer: {input_count} inputs (direct to output)")
        print_debug(f"Single-layer detected: True")
        print_debug(f"Single-layer input count: {input_count}")
        topology.append("Output Layer: 1 neuron (single layer)")
    else:
        # Standard multi-layer case
        print_debug("Single-layer detected: False")

        # First layer detection
        if '1' in weights:
            first_layer = weights['1']
            first_layer_node = next(iter(first_layer))
            input_count = len(first_layer[first_layer_node])  # Number of inputs based on the first layer's input nodes
            topology.append(f"Input Layer: {input_count} inputs")
            print_debug(f"Multi-layer input count: {input_count}")
        else:
            topology.append("Input Layer: 0 inputs (direct to output)")
            print_debug("No first layer found; assuming single-layer direct input to output.")

        # Count neurons in each hidden layer and the output layer
        for layer in sorted(weights.keys(), key=int):
            num_neurons = len(weights[layer])
            topology.append(f"Layer {layer}: {num_neurons} neurons")
            print_debug(f"Layer {layer} neuron count: {num_neurons}")

    # Add information about the activation function
    activation_info = "Sigmoid Activation: Enabled" if use_sigmoid else "Sigmoid Activation: Disabled"
    topology.append(activation_info)
    print_debug(f"Activation function: {activation_info}")
    
    return topology



def evaluate_model(weights_bias_file, validation_data_file, output_file, use_sigmoid=True, num_samples=0):
    # Load weights, biases, and single-layer flag
    weights, biases, single_layer_detected = load_weights(weights_bias_file)
    
    # Determine topology
    topology = determine_topology(weights, use_sigmoid, single_layer_detected)
    topology_str = "\n".join(topology)  # Each topology detail on a new line
    
    # Print topology to the screen
    print("Network Topology:")
    print(topology_str)
    
    # Load validation data
    df = pd.read_excel(validation_data_file)
    
    # Prepare to collect results
    results = []
    correct_predictions = 0
    
    # Iterate through validation data rows
    if num_samples > 0:
        print(f"Validating the first {num_samples} samples...")
        df = df.head(num_samples)  # Limit the number of samples to validate
    for _, row in df.iterrows():
        actual_label = row['Guilt']
        features = row.iloc[1:].values  # Extract feature values as a list
        predicted_label = forward_pass(weights, biases, features, use_sigmoid)
        
        # Record result
        results.append([actual_label, predicted_label])
        
        # Check if prediction is correct
        if actual_label == predicted_label:
            correct_predictions += 1

    # Calculate accuracy
    accuracy = (correct_predictions / len(df)) * 100

    # Write results and topology to CSV
    with open(output_file, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["Network Topology:"])
        for line in topology:
            writer.writerow([line])  # Write each line of topology separately
        writer.writerow([])  # Blank line before results
        writer.writerow(['Actual Guilt', 'Predicted Guilt'])
        writer.writerows(results)
        writer.writerow([])
        writer.writerow(['Accuracy', f"{accuracy:.2f}%"])
    
    print(f"Results saved to {output_file} with accuracy {accuracy:.2f}%")


if __name__ == "__main__":
    # Parse command line arguments
    parser = argparse.ArgumentParser(description='Dynamic neural network classifier')
    parser.add_argument('validation_data_file', type=str, help='Path to the validation data Excel file')
    parser.add_argument('weights_bias_file', type=str, help='Path to the weights and bias file')
    parser.add_argument('output_file', type=str, help='Path to the output CSV file')
    parser.add_argument('--use_sigmoid', action='store_true', help='Disable sigmoid activation for verification')
    # allow user to enter the number of samples to validate. num_samples is an integer, if the flag isn't present default is 0
    # 0 indicates that the number of samples is not limited
    parser.add_argument('--num_samples', type=int, default=0, help='Number of samples to validate (default: 0)')
    args = parser.parse_args()

    # Run the evaluation model
    evaluate_model(args.weights_bias_file, args.validation_data_file, args.output_file, args.use_sigmoid, args.num_samples)