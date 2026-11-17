% Orbit Time Helper Function

%Inputs:
% - Gravitational Parameter (mu) in km^3/s^2
% - Semi-major Axis (a) in km
% - Semi-latus Rectum (l) in km (only used for Parabolic Mean Motion)
%Outputs:
% - Mean Motion (n) in s
% - Orbit Period (p) in s

function [n, p] = computeOrbitTime(mu, a, l)
    % Mean Motion
    if a == inf
        n = 2 * sqrt(mu / l^3);
    else
        n = sqrt(mu / a^3);
    end

    % Period
    p = 2 * pi / n;
end