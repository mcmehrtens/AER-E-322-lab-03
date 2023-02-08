function eta_b = calc_eta_bearing(d, w, t, sigma_bu, sigma_tu, N)
%CALC_ETA_SHEAR Calculates the joint efficiency with respect to bearing
%failure
%   Input Arguments:
%       d:          diameter of an individual rivet [m]
%       w:          width of each sheet [m]
%       t:          thickness of each sheet [m]
%       sigma_bu:   ultimate bearing stress between rivets and sheets [Pa]
%       sigma_tu:   ultimate stress of plates/sheets in tension [Pa]
%       N:          number of rivets []
A_proj_contact  = d * t; % [m^2]
A_sheet         = w * t; % [m^2]
eta_b           = A_proj_contact * sigma_bu * N / ...
                    (A_sheet * sigma_tu); % []
end