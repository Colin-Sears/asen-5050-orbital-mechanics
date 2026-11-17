% Lambert's Function v1

%Inputs:
% - Gravitational Parameter (mu) in km^3/s^2
% - Semi-perimeter (s) in km
% - Chord (c) in km
% - Transfer Angle in degrees [0,360]
% - Time of Flight in s
% - Minimum Time of flight in s
% - Semi-major axis, which the function iterates to find
%Outputs:
% - Function for fsolve use

function F = lambertsFunction(mu, s, c, a, transferAngle, TOF, TOF_min)
    % Calculate Mean Motion
    n = sqrt(mu/a^3);

    % Calculate Auxiliary Angles
    [alpha, beta] = computeAuxiliaryAngles(s, c, a, transferAngle, TOF, TOF_min);

    % Compute time of flight residual
    F = (1/n) * ((alpha - beta) - (sin(alpha) - sin(beta))) - TOF;
end