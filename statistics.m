clc; close all; clear;
format short

% Specify the file name
filename = 'C:\Users\Yeah buddy\OneDrive\Documents\MATLAB\Utilities\test.txt';

% Read the numbers into an array
fileID = fopen(filename, 'r');
numbers = fscanf(fileID, '%f');
fclose(fileID);

% Calculate average, maximum, and minimum
average = mean(numbers);
maximum = max(numbers);
minimum = min(numbers);

% Display the results
fprintf('Average: %f\n', average);
fprintf('Maximum: %f\n', maximum);
fprintf('Minimum: %f\n', minimum);