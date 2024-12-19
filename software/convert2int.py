#!/usr/bin/env python3

import sys
import pandas as pd

def convert_to_int(input_file, output_file):
    try:
        # Read the Excel file
        df = pd.read_excel(input_file)

        # Check if 'Guilt' is the first column
        if df.columns[0] != 'Guilt':
            print("Error: The first column must be 'Guilt'.")
            sys.exit(1)

        # Create a copy to modify
        df_new = df.copy()

        # Identify the columns to scale (all except the first column "Guilt")
        columns_to_scale = df.columns[1:]

        # Multiply by 3, round to nearest integer, and convert to integer type
        df_new[columns_to_scale] = (df[columns_to_scale] * 3).round().astype(int)

        # Write to new Excel file
        df_new.to_excel(output_file, index=False)

        print(f"Conversion successful! Output saved to '{output_file}'.")
    except FileNotFoundError:
        print(f"Error: The file '{input_file}' was not found.")
        sys.exit(1)
    except Exception as e:
        print(f"An error occurred: {e}")
        sys.exit(1)

def main():
    if len(sys.argv) != 3:
        print("Usage: convert2int <input_file.xlsx> <output_file.xlsx>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    convert_to_int(input_file, output_file)

if __name__ == "__main__":
    main()
