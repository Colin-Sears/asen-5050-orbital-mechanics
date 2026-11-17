% Lagrange Coefficient Function v1

%Inputs:
% - Gravitational Parameter (mu) in km^3/s^2
% - Position Vectors in km
% - Transfer Angle in degrees
% - Transfer Orbit semi-latus rectum in km
%Outputs:
% - f dimensionless
% - g in s
% - f_dot in 1/s
% - g_dot dimensionless

function [f, g, f_dot, g_dot] = calculateLagrangeCoef(mu, r_1, r_2, transferAngle, p)
    r_1 = norm(r_1);
    r_2 = norm(r_2);
    
    f = 1 - (r_2 / p) * (1 - cosd(transferAngle));
    g = (r_1 * r_2 / sqrt(mu * p)) * sind(transferAngle);
    f_dot = sqrt(mu / p) * tand(transferAngle / 2) * (((1-cosd(transferAngle))/p) - (1/r_2) - (1/r_1));
    g_dot = 1 - (r_1 / p) * (1 - cosd(transferAngle));
end
