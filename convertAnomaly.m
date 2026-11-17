% Anomaly Conversion Function v1

%v1 Only True Anomaly Conversion + no parabolic anomaly

%Inputs:
% - Orbit Type String
% - Eccentricity
% - True Anomaly (theta_star) in degrees[-180, 180]
%Outputs:
% - Eccentric/Hyperbolic Anomaly (E) in radians [0, 2pi]
% - Mean Anomaly (M) in radians [0, 2pi]

function [E, M] = convertAnomaly(orbit_type, e_mag, theta_star)
    if orbit_type == "Elliptical"
        E = 2 * atan(sqrt((1-e_mag)/(1+e_mag)) * tand(theta_star/2));
        M = E - e_mag*sin(E);
    elseif orbit_type == "Hyperbolic"
        E = 2 * atanh(sqrt((e_mag-1)/(e_mag+1)) * tand(theta_star/2));
        M = e_mag*sinh(E) - E;
    else
        warning("Eccentric & Mean Anomalies are Undefined for Parabolic & Circular orbits");
    end
end