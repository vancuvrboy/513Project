import argparse
import pandas as pd
import csv

def load_coefficients(coefficients_file):
    """
    Loads model coefficients of the form:
    w1 = ...
    w2 = ...
    ...
    b = ...
    Returns (weights, bias).
    """
    weights = []
    bias = 0.0
    with open(coefficients_file, 'r') as f:
        for line in f:
            line = line.strip()
            if line.startswith("w"):
                # Example format: w1 = 0.12345
                parts = line.split("=")
                if len(parts) == 2:
                    val = float(parts[1].strip())
                    weights.append(val)
            elif line.startswith("b"):
                # Example format: b = 0.12345
                parts = line.split("=")
                if len(parts) == 2:
                    bias = float(parts[1].strip())
    return weights, bias

def main():
    parser = argparse.ArgumentParser(description='Validate a linear regression classifier.')
    parser.add_argument('validation_data_file', type=str, help='Path to the validation data Excel file')
    parser.add_argument('coefficients_file', type=str, help='Path to the coefficients .txt file from training')
    parser.add_argument('output_file', type=str, help='Path to the output .csv file')
    parser.add_argument('--num_samples', type=int, default=0, help='Number of samples to use (default: 0 for all samples)')

    args = parser.parse_args()

    # Load validation data
    df = pd.read_excel(args.validation_data_file)

    # If num_samples > 0, limit the dataset
    if args.num_samples > 0:
        df = df.head(args.num_samples)

    # The first column is the label
    y = df.iloc[:, 0].values
    X = df.iloc[:, 1:].values

    # Load coefficients
    weights, bias = load_coefficients(args.coefficients_file)

    # Convert weights to a list if needed
    weights = list(weights)

    # Predict
    predictions = []
    for features, actual_label in zip(X, y):
        # Linear model: prediction = sum(w_i * x_i) + b
        pred_value = sum(w * x for w, x in zip(weights, features)) + bias
        # Threshold at 0.5 for classification
        predicted_label = 1.0 if pred_value >= 0.5 else 0.0
        predictions.append((actual_label, predicted_label))

    # Calculate accuracy
    correct = sum(1 for a, p in predictions if a == p)
    accuracy = (correct / len(predictions)) * 100 if len(predictions) > 0 else 0.0

    # Write output CSV
    with open(args.output_file, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(["Linear Regression Validation:"])
        writer.writerow([])
        writer.writerow(["Actual Label", "Predicted Label"])
        for a, p in predictions:
            writer.writerow([a, p])
        writer.writerow([])
        writer.writerow(["Accuracy", f"{accuracy:.2f}%"])

    print(f"Validation results written to {args.output_file} with accuracy {accuracy:.2f}%")

if __name__ == "__main__":
    main()
