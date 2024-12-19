import matplotlib.pyplot as plt
import networkx as nx
import re
import argparse

def parse_weights_and_biases(file_path):
    """
    Parse the weights and biases from a file into a structured dictionary.

    Args:
    - file_path (str): Path to the weights and biases file.

    Returns:
    - connections (list of dict): Parsed connections with their weights.
    - biases (dict): Parsed biases for each node.
    """
    connections = []
    biases = {}
    pattern_weight = re.compile(r'w(\d+)_(\d+)_(\d+) = ([\-\d\.]+)')
    pattern_bias = re.compile(r'b(\d+)_(\d+) = ([\-\d\.]+)')

    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            if match := pattern_weight.match(line):
                layer, to_node, from_node, weight = match.groups()
                connections.append({
                    'Layer': int(layer),
                    'From': f"N{from_node}_L{int(layer)-1}",
                    'To': f"N{to_node}_L{layer}",
                    'Weight': float(weight)
                })
            elif match := pattern_bias.match(line):
                layer, node, bias = match.groups()
                biases[f"N{node}_L{layer}"] = float(bias)
    
    return connections, biases

def draw_neural_network_from_file(file_path):
    """
    Draws a neural network visualization based on weights and biases read from a file.

    Args:
    - file_path (str): Path to the weights and biases file.
    """
    connections, biases = parse_weights_and_biases(file_path)

    # Create a directed graph
    G = nx.DiGraph()

    # Add edges for weights
    for conn in connections:
        G.add_edge(conn['From'], conn['To'], weight=conn['Weight'])

    # Add biases as node attributes
    for node, bias in biases.items():
        G.nodes[node]['bias'] = bias

    # Determine the layer structure
    layers = {int(node.split("_L")[1]) for node in G.nodes}
    pos = nx.multipartite_layout(G, subset_key=lambda n: int(n.split("_L")[1]))  # Layer-based layout

    # Draw the graph
    plt.figure(figsize=(12, 8))
    nx.draw_networkx_nodes(G, pos, node_size=700, node_color='lightblue')
    nx.draw_networkx_edges(G, pos, edge_color='black', arrowsize=20)
    nx.draw_networkx_labels(G, pos, font_size=10)

    # Add edge labels (weights)
    edge_labels = nx.get_edge_attributes(G, 'weight')
    nx.draw_networkx_edge_labels(G, pos, edge_labels={k: f"{v:.2f}" for k, v in edge_labels.items()})

    # Add bias labels
    for node, bias in biases.items():
        x, y = pos[node]
        plt.text(x, y + 0.1, f"b={bias:.2f}", fontsize=8, ha='center', color='red')

    plt.title("Neural Network Visualization")
    plt.show()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Visualize a neural network from weights and biases file.")
    parser.add_argument("file", type=str, help="Path to the weights and biases file")
    args = parser.parse_args()

    draw_neural_network_from_file(args.file)
