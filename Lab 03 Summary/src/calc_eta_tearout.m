function eta_to = calc_eta_tearout(w, t, e, tau_sup, sigma_tu, N_e)
%CALC_ETA_SHEAR Calculates the joint efficiency with respect to tearout
%failure
%   Input Arguments:
%       w:          width of each sheet [m]
%       t:          thickness of each sheet [m]
%       e:          distance of rivet center from the edge [m]
%       tau_sup:    ultimate shearing stress of plate [Pa]
%       sigma_tu:   ultimate stress of plates/sheets in tension [Pa]
%       N_e:        number of rivets in row closest to the edge of either
%                   plate []
A_sheet = w * t; % [m^2]
eta_to = 2 * t * e * tau_sup * N_e / (A_sheet * sigma_tu); % []
end