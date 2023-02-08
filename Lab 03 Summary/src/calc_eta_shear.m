function eta_s = calc_eta_shear(d, w, t, tau_su, sigma_tu, N)
%CALC_ETA_SHEAR Calculates the joint efficiency with respect to shear
%failure
%   Input Arguments:
%       d:          diameter of an individual rivet [m]
%       w:          width of each sheet [m]
%       t:          thickness of each sheet [m]
%       tau_su:     ultimate shearing stress of rivets [Pa]
%       sigma_tu:   ultimate stress of plates/sheets in tension [Pa]
%       N:          number of rivets []
A_r     = pi * d^2 / 4; % [m]^2
A_sheet = w * t; % [m]^2
eta_s   = A_r * tau_su * N / (A_sheet * sigma_tu); % []
end