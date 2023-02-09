% AER E 322 Spring 2023 Lab 03 Pre-Lab
% Matthew Mehrtens
clear, clc, close all;

% Rivet/Sheet Characteristics
d = 5/32;    % [in]
w = 1 + 3/8;      % [in]
t = 0.025;  % [in]

% Layout Characteristics
e = 1;            % [in] -- distance of rivet center from the edge
layout  = [1, 3, 1];   % [] -- rivets in each row counting from the loaded row
N = sum(layout);    % []
N_e = layout(3);    % []

% Material Characteristics
sigma_tu            = 70*10^3;      % [psi]
sigma_bu            = 124*10^3;      % [psi]
tau_su              = 30*10^3;      % [psi]
tau_sup             = 41*10^3;       % [psi]

% Calculate Joint Efficiencies
eta_s   = calc_eta_shear(d, w, t, tau_su, sigma_tu, N);         % []
eta_b   = calc_eta_bearing(d, w, t, sigma_bu, sigma_tu, N);     % []
eta_to  = calc_eta_tearout(w, t, e, tau_sup, sigma_tu, N_e);    % []

eta_t1  = calc_eta_tension( ...
    d, w, t, N, sum(layout(1:0)), layout(1));   % []
eta_t2  = calc_eta_tension( ...
    d, w, t, N, sum(layout(1:1)), layout(2));   % []
eta_t3  = calc_eta_tension( ...
    d, w, t, N, sum(layout(1:2)), layout(3));   % []

% Calculate maximum load (or stress) for each failure mode
F_s         = N * tau_su * pi * d^2 / 4;            % [lb]
F_b         = N * sigma_bu * d * t;                 % [lb]
F_to        = 2 * t * e * tau_sup * N_e;            % [lb]

F_t2        = sigma_tu * (w - layout(2) * d) * t;   % [lb]
F_t1        = 5 / 4 * F_t2;                         % [lb]
F_t3        = (N - sum(layout(1:2))) / N * F_t1;    % [lb]
sigma_t1    = F_t1 / ((w - layout(1) * d) * t);     % [psi]
sigma_t2    = F_t2 / ((w - layout(2) * d) * t);     % [psi]
sigma_t3    = F_t3 / ((w - layout(3) * d) * t);     % [psi]

% Print out the efficiencies
fprintf(['\x03B7_s  = %6.4g []\n' ...
         '\x03B7_b  = %6.4g []\n' ...
         '\x03B7_to = %6.4g []\n' ...
         '\x03B7_t1 = %6.4g []\n' ...
         '\x03B7_t2 = %6.4g []\n' ...
         '\x03B7_t3 = %6.4g []\n'], ...
         eta_s, eta_b, eta_to, eta_t1, eta_t2, eta_t3);

fprintf('\n');

% Print out the maximum loads for each failure mode
fprintf(['F_s  = %6.4g [lb]\n' ...
         'F_b  = %6.4g [lb]\n' ...
         'F_to = %6.4g [lb]\n' ...
         'F_t1 = %6.4g [lb]\n' ...
         'F_t2 = %6.4g [lb]\n' ...
         'F_t3 = %6.4g [lb]\n' ...
         '\x03C3_t1 = %6.4g [ksi]\n' ...
         '\x03C3_t2 = %6.4g [ksi]\n' ...
         '\x03C3_t3 = %6.4g [ksi]\n'], ...
         F_s, F_b, F_to, F_t1, F_t2, F_t3, ...
         sigma_t1 / 1000, sigma_t2 / 1000, sigma_t3 / 1000);