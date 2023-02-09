function eta_s = calc_eta_shear(d, w, t, tau_su, sigma_tu, N)
%CALC_ETA_SHEAR Calculates the joint efficiency with respect to shear
%failure
%   Input Arguments:
%       d:          diameter of an individual rivet [in]
%       w:          width of each sheet [in]
%       t:          thickness of each sheet [in]
%       tau_su:     ultimate shearing stress of rivets [psi]
%       sigma_tu:   ultimate stress of plates/sheets in tension [psi]
%       N:          number of rivets []
A_r     = pi * d^2 / 4; % [in^2]
A_sheet = w * t; % [in^2]
eta_s   = A_r * tau_su * N / (A_sheet * sigma_tu); % []
end