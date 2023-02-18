%Lab 03 data Peter Mikolitis
% Load the data from the Excel file
clear, clc, clf, close all;
data = readmatrix("Lab 03 Data.csv");

original_length = 14; % [in]
cross_sectional_area = 0.05; % [in^2]

% Calculate strain values
extension = data(4:end, 2); % [in]
strain = extension / original_length; % []

% Calculate the stress values
load = data(4:end, 3); % [lbf]
stress = load / cross_sectional_area / 1000; % [ksi]

% Create the stress-strain graph
figure;
plot(strain, stress);
grid on;
xlabel('Strain []');
ylabel('Stress [ksi]');
title('Stress-Strain Graph');


