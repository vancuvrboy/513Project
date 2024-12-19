import matplotlib
matplotlib.use('Qt5Agg')  # Or 'Agg' for non-interactive backend
import matplotlib.pyplot as plt
import networkx as nx
import re
import argparse

def parse_weights_and_biases(file_path):
    """
    Parse the weights and biases from a file into a structured dictionary.

    Supports both multi-layer and single-layer network formats.

    Args:
    - file_path (str): Path to the weights and biases file.

    Returns:
    - connections (list of dict): Parsed connections with their weights.
    - biases (dict): Parsed biases for each node.
    """
    connections = []
    biases = {}
    # Multi-layer patterns
    pattern_weight_multi = re.compile(r'w(\d+)_(\d+)_(\d+) = ([\-\d\.]+)')
    pattern_bias_multi = re.compile(r'b(\d+)_(\d+) = ([\-\d\.]+)')
    # Single-layer patterns
    pattern_weight_single = re.compile(r'w(\d+) = ([\-\d\.]+)')
    pattern_bias_single = re.compile(r'b = ([\-\d\.]+)')

    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            # Check for multi-layer weight
            if match := pattern_weight_multi.match(line):
                layer, to_node, from_node, weight = match.groups()
                connections.append({
                    'Layer': int(layer),
                    'From': f"N{from_node}_L{int(layer)-1}",
                    'To': f"N{to_node}_L{layer}",
                    'Weight': float(weight),
                    'Weight_Name': f'w{layer}_{to_node}_{from_node}'
                })
            # Check for multi-layer bias
            elif match := pattern_bias_multi.match(line):
                layer, node, bias = match.groups()
                biases[f"N{node}_L{layer}"] = float(bias)
            # Check for single-layer weight
            elif match := pattern_weight_single.match(line):
                from_node_num, weight = match.groups()
                from_node = f"N{from_node_num}_L0"
                to_node = "N1_L1"  # Assuming a single output node
                connections.append({
                    'Layer': 1,
                    'From': from_node,
                    'To': to_node,
                    'Weight': float(weight),
                    'Weight_Name': f'w1_{from_node_num}_1'
                })
            # Check for single-layer bias
            elif match := pattern_bias_single.match(line):
                biases["N1_L1"] = float(match.group(1))
            else:
                # Line does not match any known pattern; ignore or handle as needed
                pass

    return connections, biases

def manual_layered_layout(G, layer_spacing=2, node_spacing=1, subset_key="subset"):
    """
    Generate manual node positions for a layered layout, ensuring all layers are vertically centered.

    Parameters:
    - G (networkx.Graph): The graph with nodes assigned to layers.
    - layer_spacing (float): Horizontal spacing between layers.
    - node_spacing (float): Vertical spacing between nodes within a layer.
    - subset_key (str): Node attribute key that specifies the layer.

    Returns:
    - dict: A dictionary mapping nodes to positions (x, y).
    """
    pos = {}
    layers = {}

    # Organize nodes into layers based on the subset_key
    for node in G.nodes:
        layer = G.nodes[node].get(subset_key, 0)  # Default to layer 0 if not specified
        if layer not in layers:
            layers[layer] = []
        layers[layer].append(node)

    # Calculate the maximum number of nodes in any layer
    max_nodes = max(len(nodes) for nodes in layers.values())
    total_height = (max_nodes - 1) * node_spacing  # Total height for uniform spacing

    # Generate positions for each layer, centering nodes within the total height
    for layer, nodes in sorted(layers.items()):
        num_nodes = len(nodes)
        if num_nodes > 1:
            spacing = total_height / (num_nodes - 1)
            start_y = -total_height / 2
        else:
            spacing = 0  # Single node, no spacing needed
            start_y = 0  # Center single node vertically
        for i, node in enumerate(nodes):
            pos[node] = (layer * layer_spacing, start_y + i * spacing)

    return pos

def draw_neural_network_from_file(file_path, weight_name=False, n_s=100, f_s=12):
    """
    Draws a neural network visualization based on weights and biases read from a file.

    Supports both multi-layer and single-layer networks.

    Args:
    - file_path (str): Path to the weights and biases file.
    - weight_name (bool): Whether to show weight names instead of values.
    """
    connections, biases = parse_weights_and_biases(file_path)

    # Create a directed graph
    G = nx.DiGraph()

    # Add edges for weights
    for conn in connections:
        G.add_edge(conn['From'], conn['To'], weight=conn['Weight'], weight_name=conn['Weight_Name'])

    # Add biases as node attributes
    for node, bias in biases.items():
        G.nodes[node]['bias'] = bias

    # Assign subset (layer) attribute to nodes
    for node in G.nodes:
        try:
            layer = int(node.split("_L")[1])  # Extract layer from node name
        except IndexError:
            layer = 0  # Default to layer 0 if not specified
        G.nodes[node]['subset'] = layer

    # Use the manual layered layout
    layer_spacing = 20  # Adjust as needed
    node_spacing = 100  # Adjust as needed
    pos = manual_layered_layout(G, layer_spacing=layer_spacing, node_spacing=node_spacing, subset_key="subset")

    # Calculate dynamic figure size based on layout extent
    x_positions = [p[0] for p in pos.values()]
    y_positions = [p[1] for p in pos.values()]
    width = (max(x_positions) - min(x_positions)) / 10 + 5  # Adjust scaling factor as needed
    height = (max(y_positions) - min(y_positions)) / 10 + 5  # Adjust scaling factor as needed

    plt.figure(figsize=(width, height))
    nx.draw_networkx_nodes(G, pos, node_size=n_s, node_color='lightblue')
    nx.draw_networkx_edges(G, pos, edge_color='black', arrowsize=20)
    nx.draw_networkx_labels(G, pos, font_size=12, font_weight='bold')

    # Add edge labels (weights or weight names) with dynamic positioning
    edge_labels = {}
    for src, dst, data in G.edges(data=True):
        src_layer = G.nodes[src]['subset']
        src_nodes = [n for n in G.nodes if G.nodes[n]['subset'] == src_layer]
        src_index = src_nodes.index(src)
        num_src_nodes = len(src_nodes)

        # Calculate the fraction for dynamic label positioning
        fraction = (src_index + 1) / (num_src_nodes + 1)  # Dynamic fraction based on source node index
        src_x, src_y = pos[src]
        dst_x, dst_y = pos[dst]
        label_x = src_x + fraction * (dst_x - src_x)
        label_y = src_y + fraction * (dst_y - src_y)

        if weight_name:
            label = data['weight_name']
        else:
            label = f"{data['weight']:.2f}"
        
        # Assign the calculated position to the label
        edge_labels[(label_x, label_y)] = label

    # Draw the labels at the calculated positions
    for (label_x, label_y), text in edge_labels.items():
        plt.text(label_x, label_y, text, fontsize=f_s, color='blue', ha='center', va='center')

    # Add bias labels
    for node, bias in biases.items():
        x, y = pos[node]
        plt.text(x, y + 1, f"b={bias:.2f}", fontsize=f_s, ha='center', color='red')

    plt.title("Neural Network Visualization")
    plt.axis('off')  # Hide axes for cleaner visualization
    plt.show()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Visualize a neural network from weights and biases file.")
    parser.add_argument("file", type=str, help="Path to the weights and biases file")
    parser.add_argument("--weight_name", action="store_true", help="Show weight name instead of weight value")
    # adjust the node size, default is 1000
    parser.add_argument("--node_size", type=int, default=1000, help="Size of the nodes in the network")
    parser.add_argument("--font_size", type=int, default=10, help="Label Font Size")
    args = parser.parse_args()

    draw_neural_network_from_file(args.file, args.weight_name, args.node_size, args.font_size)
