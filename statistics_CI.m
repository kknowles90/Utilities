% Specify the file name
filename = 'C:\Users\Yeah buddy\OneDrive\Documents\MATLAB\Utilities\test.txt';

% Read the numbers into an array
fileID = fopen(filename, 'r');
numbers = fscanf(fileID, '%f');
fclose(fileID);

% Calculate number of elements
S = length(numbers);

% Calculate average, maximum, minimum, and standard deviation
average = mean(numbers);
maximum = max(numbers);
minimum = min(numbers);
std_dev = std(numbers);

% Display the basic statistics
fprintf('Number of elements: %d\n', S);
fprintf('Average: %f\n', average);
fprintf('Maximum: %f\n', maximum);
fprintf('Minimum: %f\n', minimum);
fprintf('Standard Deviation: %f\n', std_dev);

% Confidence Interval Calculation
confidence_level = 0.95;  % 95% confidence level
alpha = 1 - confidence_level;
t_score = tinv(1 - alpha/2, S - 1); %Error on tinv line if Statistics and Machine Learning Toolbox not installed
margin_of_error = t_score * std_dev / sqrt(S);
CI_lower = average - margin_of_error;
CI_upper = average + margin_of_error;

% Display the confidence interval
fprintf('95%% Confidence Interval for the Mean: [%f, %f]\n', CI_lower, CI_upper);