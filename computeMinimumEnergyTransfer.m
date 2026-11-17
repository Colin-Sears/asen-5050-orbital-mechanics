% Minimum Energy Transfer Function

%Inputs:
% - Gravitational Parameter (mu) in km^3/s^2
% - Semi-perimeter (s) in km
% - Chord (c) in km
% - Transfer Angle in degrees [0,360]
%Outputs:
% - Minimum Semi-major Axis (a_min) in km
% - Minimum Time of Flight (TOF_min) in s
% - Minimum Alpha (alpha_min) in rad [0, pi]
% - Minimum Beta (beta_min) in rad [-pi, pi]

function [a_min, TOF_min, alpha_min, beta_min] = computeMinimumEnergyTransfer(mu, s, c, transferAngle)
    % Minimum Semi-major Axis
    a_min = s/2;

    % Minimum Mean Motion
    n_min = sqrt(mu/a_min^3);

    % Minimum Alpha and Beta Angles
    alpha_min = pi;
    beta_min = 2 * asin(sqrt((s-c)/s));
    if transferAngle > 180
        beta_min = -beta_min;
    end

    TOF_min = 1/n_min * ((alpha_min - beta_min) - (sin(alpha_min) - sin(beta_min)));

end
