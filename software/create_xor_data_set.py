import pandas as pd

# Create XOR dataset
data = {
    "Input1": [0, 0, 1, 1],
    "Input2": [0, 1, 0, 1],
    "Output": [0, 1, 1, 0]
}

# Convert to a DataFrame
df = pd.DataFrame(data)

# Save to Excel for training/testing
df.to_excel("xor_dataset.xlsx", index=False)
