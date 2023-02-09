% AER E 322 Spring 2023 Lab 03 Pre-Lab
% Matthew Mehrtens
clear, clc, close all;

% Rivet/Sheet Characteristics
d = 1/8;    % [in]
w = 2;      % [in]
t = 0.025;  % [in]

% Layout Characteristics
e = 0.5;            % [in] -- distance of rivet center from the edge
layout  = [2, 2];   % [] -- rivets in each row counting from the loaded row
N = sum(layout);    % []
N_e = layout(2);    % []

% Material Characteristics
sigma_tu    = 27*10^3;  % [psi]
sigma_bu    = 50*10^3;  % [psi]
tau_su      = 18*10^3;  % [psi]
tau_sup     = tau_su;   % [psi]

% Calculate Joint Efficiencies
eta_s   = calc_eta_shear(d, w, t, tau_su, sigma_tu, N);         % []
eta_b   = calc_eta_bearing(d, w, t, sigma_bu, sigma_tu, N);     % []
eta_to  = calc_eta_tearout(w, t, e, tau_sup, sigma_tu, N_e);    % []

eta_t1  = calc_eta_tension( ...
    d, w, t, N, sum(layout(1:0)), layout(1));   % []
eta_t2  = calc_eta_tension( ...
    d, w, t, N, sum(layout(1:1)), layout(2));   % []

% Calculate maximum load (or stress) for each failure mode
F_s         = N * tau_su * pi * d^2 / 4;            % [lb]
F_b         = N * sigma_bu * d * t;                 % [lb]
F_to        = 2 * t * e * tau_sup * N_e;            % [lb]

F_t1        = sigma_tu * (w - layout(1) * d) * t;   % [lb]
F_t2        = (N - sum(layout(1:1))) / N * F_t1;    % [lb]
sigma_t1    = F_t1 / ((w - layout(1) * d) * t);     % [psi]
sigma_t2    = F_t2 / ((w - layout(2) * d) * t);     % [psi]

% Print out the efficiencies
fprintf(['\x03B7_s  = %6.4g []\n' ...
         '\x03B7_b  = %6.4g []\n' ...
         '\x03B7_to = %6.4g []\n' ...
         '\x03B7_t1 = %6.4g []\n' ...
         '\x03B7_t2 = %6.4g []\n'], eta_s, eta_b, eta_to, eta_t1, eta_t2);

fprintf('\n');

% Print out the maximum loads for each failure mode
fprintf(['F_s  = %6.4g [lb]\n' ...
         'F_b  = %6.4g [lb]\n' ...
         'F_to = %6.4g [lb]\n' ...
         'F_t1 = %6.4g [lb]\n' ...
         'F_t2 = %6.4g [lb]\n' ...
         '\x03C3_t1 = %6.4g [ksi]\n' ...
         '\x03C3_t2 = %6.4g [ksi]\n'], ...
         F_s, F_b, F_to, F_t1, F_t2, sigma_t1 / 1000, sigma_t2 / 1000);