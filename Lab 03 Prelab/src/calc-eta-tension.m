function eta_t = calc_eta_tension(d, w, t, N, n, N_row)
%CALC_ETA_SHEAR Calculates the joint efficiency with respect to tension
%failure
%   Input Arguments:
%       d:          diameter of an individual rivet [in]
%       w:          width of each sheet [in]
%       t:          thickness of each sheet [in]
%       N:          total number of rivets []
%       n:          total number of rivets in all previous rows []
%       N_row:      total number of rivets in the current row []
A_net   = (w - d * N_row) * t; % [in^2]
A_sheet = w * t; % [in^2]
eta_t   = A_net / ((N - n) / N * A_sheet); % []
end