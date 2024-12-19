import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import StandardScaler
import sys

def plot_loan_classification(filename, num_points, feature_x, feature_y):
    # Load the dataset
    data = pd.read_excel(filename)

    # Select the relevant features and target
    X = data[[feature_x]]
    y = data[feature_y]
    Guilt = data['Guilt']  # Add Guilt for coloring points

    # Standardize the features for better regression performance
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)
    y_scaled = scaler.fit_transform(y.values.reshape(-1, 1)).flatten()

    # Debug: Print scaling parameters
    print("Scaler mean (X):", scaler.mean_)
    print("Scaler scale (X):", scaler.scale_)

    # Fit a linear regression model
    model = LinearRegression()
    model.fit(X_scaled, y_scaled)

    # Debug: Print model coefficients and intercept
    print("Model coefficient:", model.coef_)
    print("Model intercept:", model.intercept_)

    # Extract a subset of data for plotting
    sampled_data = data.sample(n=num_points, random_state=42)
    X_sampled = sampled_data[[feature_x]]
    y_sampled = sampled_data[feature_y]
    Guilt_sampled = sampled_data['Guilt']

    # Scatter plot the sampled data with color coding for Guilt
    plt.figure(figsize=(10, 6))
    colors = ['red' if status == 1 else 'blue' for status in Guilt_sampled]
    plt.scatter(X_sampled, y_sampled, c=colors, label='Data Points')

    # Generate the regression line
    x_min, x_max = X_scaled.min(), X_scaled.max()
    x_scaled_values = np.linspace(x_min, x_max, 500).reshape(-1, 1)
    y_scaled_values = model.predict(x_scaled_values)

    # Transform x and y values back to the original space
    x_values = x_scaled_values * scaler.scale_[0] + scaler.mean_[0]
    y_values = y_scaled_values * scaler.scale_[0] + scaler.mean_[0]

    # Debug: Print samples of transformed values
    print("x_scaled_values sample:", x_scaled_values[:5].flatten())
    print("y_scaled_values sample:", y_scaled_values[:5].flatten())
    print("x_values sample:", x_values[:5].flatten())
    print("y_values sample:", y_values[:5].flatten())

    plt.plot(x_values, y_values, color='green', label='Regression Line')

    # Add legend for points
    from matplotlib.lines import Line2D
    legend_elements = [Line2D([0], [0], marker='o', color='w', label='Not Deceptive (0)', markerfacecolor='blue', markersize=10),
                       Line2D([0], [0], marker='o', color='w', label='Deceptive (1)', markerfacecolor='red', markersize=10)]
    plt.legend(handles=legend_elements, loc='upper left')

    # Set plot labels and title
    plt.xlabel(f'{feature_x} (Original Scale)')
    plt.ylabel(f'{feature_y} (Original Scale)')
    plt.title(f'Linear Regression: {feature_x} vs {feature_y}')
    plt.grid(True)
    plt.show()

# Example usage (replace parameters with actual values as needed)
if __name__ == "__main__":
    # Example parameters: Adjust these when running the script
    input_file = 'TrainTestData/sample1_39_cues.xlsx'  # Replace with the actual file path
    points_to_plot = 82  # Adjust as needed
    feature_x = 'S83_mean'  # Replace with desired feature
    feature_y = 'S25_mean'  # Replace with desired feature

    plot_loan_classification(input_file, points_to_plot, feature_x, feature_y)