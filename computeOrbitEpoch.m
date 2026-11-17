% Orbit Epoch Helper Function

%Inputs:
% - Position Vector in km
% - Velocity Vector in km/s
% - Eccentricity Vector
% - Orbit Type String
%Outputs:
% - True Anomaly in degrees [-180,180]
% - Eccentric/Hyperbolic Anomaly in radians [0, 2pi]
% - Mean Anomaly in radians [0, 2pi]

function [theta_star, E, M] = computeOrbitEpoch(r, v, e, orbit_type)
    r_mag = norm(r);
    e_mag = norm(e);

    % True Anomaly
    theta_star = acosd(dot(r,e) / (r_mag * e_mag));
    if dot(r,v) < 0
        theta_star = -theta_star;
    end

    % Eccentric/Hyperbolic & Mean Anomalies
    [E, M] = convertAnomaly(orbit_type, e_mag, theta_star);
end