% Orbit Rotation Helper Function

%Inputs:
% - Specific Angular Momentum Vector in km^2/s
% - Eccentricity Vector
% - True Anomaly (theta_star) in degrees[-180, 180]
%Outputs:
% - Inclination (i) in degrees [0, 180]
% - RAAN (Omega) in degrees [-180, 180]
% - Argument of Periapsis (omega) in degrees [-180, 180]
% - True Longitude of Periapsis (omega_true) in degrees [-180, 180]
% - Argument of Latitude (u) in degrees [-180, 180]
% - True Longitude (lambda_true) in degrees [-180, 180]
% - Line of Nodes (lon) as a vector

function [i, Omega, omega, omega_true, u, lambda_true, lon] = computeOrbitRotation(h, e, theta_star)
    e_mag = norm(e);

    % Inclination
    i = acosd(h(3) / norm(h));
    
    % Line of Nodes
    lon = cross([0, 0, 1], h);
    lon_mag = norm(lon);
    
    % RAAN
    Omega = acosd(lon(1) / lon_mag);
    if lon(2) < 0 %Quadrant Check
        Omega = -Omega;
    end
    
    % Argument of Periapsis
    omega = acosd(dot(lon,e) / (lon_mag * e_mag));
    if e(3) < 0 %Quadrant Check
        omega = -omega;
    end

    % True Longitude of Periapsis
    if i == 0 && e_mag ~= 0
        omega_true = acosd(dot([1, 0, 0], e) / (e_mag));
        if e(2) < 0 %Quadrant Check
            omega_true = -omega_true;
        end
    else
        omega_true = omega + Omega;
    end    

    % Argument of Latitude
    if i ~= 0 && e_mag == 0
        u = acosd(dot(lon, r) / (n_mag * r_mag));
        if r(3) < 0 %Quadrant Check
            u = -u;
        end
    else
        u = theta_star + omega;
    end

    % True Longitude
    if i == 0 && e_mag == 0
        lambda_true = acosd(dot([1, 0, 0], r) / (r_mag));
        if r(2) < 0 %Quadrant Check
            lambda_true = -lambda_true;
        end
    else
        lambda_true = theta_star + omega_true;
    end
end
