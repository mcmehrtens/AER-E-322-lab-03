function eta_to = calc_eta_tearout(w, t, e, tau_sup, sigma_tu, N_e)
%CALC_ETA_SHEAR Calculates the joint efficiency with respect to tearout
%failure
%   Input Arguments:
%       w:          width of each sheet [in]
%       t:          thickness of each sheet [in]
%       e:          distance of rivet center from the edge [in]
%       tau_sup:    ultimate shearing stress of plate [psi]
%       sigma_tu:   ultimate stress of plates/sheets in tension [psi]
%       N_e:        number of rivets in row closest to the edge of either
%                   plate []
A_sheet = w * t; % [in^2]
eta_to = 2 * t * e * tau_sup * N_e / (A_sheet * sigma_tu); % []
end