function eta_t = calc_eta_tension(d, w, t, N, n, N_row)
%CALC_ETA_SHEAR Calculates the joint efficiency with respect to tension
%failure
%   Input Arguments:
%       d:          diameter of an individual rivet [m]
%       w:          width of each sheet [m]
%       t:          thickness of each sheet [m]
%       N:          total number of rivets []
%       n:          total number of rivets in all previous rows []
%       N_row:      total number of rivets in the current row []
A_net   = (w - d * N_row) * t; % [m^2]
A_sheet = w * t; % [m^2]
eta_t   = A_net / ((N - n) / N * A_sheet); % []
end