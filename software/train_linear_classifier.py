import argparse
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression

def main():
    parser = argparse.ArgumentParser(description='Train a linear regression classifier.')
    parser.add_argument('input_file', type=str, help='Path to the training data Excel file')
    parser.add_argument('output_file', type=str, help='Path to the output .txt file for coefficients')
    parser.add_argument('--num_samples', type=int, default=0, help='Number of samples to use (default: 0 for all samples)')

    args = parser.parse_args()

    # Load the training data
    df = pd.read_excel(args.input_file)
    
    # If num_samples > 0, limit the dataset
    if args.num_samples > 0:
        df = df.head(args.num_samples)

    # The first column is the label
    y = df.iloc[:, 0].values
    X = df.iloc[:, 1:].values

    # Train a simple linear regression model
    model = LinearRegression()
    model.fit(X, y)

    # Extract coefficients
    coefficients = model.coef_
    intercept = model.intercept_

    # Write coefficients in the desired format
    # e.g., w1 = <value>, w2 = <value>, ... wN = <value>, b = <value>
    with open(args.output_file, 'w') as f:
        f.write("Model:\n")
        for i, coeff in enumerate(coefficients, start=1):
            f.write(f"w{i} = {coeff}\n")
        f.write(f"b = {intercept}\n")

    print(f"Coefficients written to {args.output_file}")

if __name__ == "__main__":
    main()
