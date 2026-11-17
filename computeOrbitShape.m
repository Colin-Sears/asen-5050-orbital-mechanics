% Orbit Size & Shape Helper Function

%Inputs:
% - Gravitational Parameter (mu) in km^3/s^2
% - Position Vector in km
% - Velocity Vector in km/s
% - Specific Angular Momentum Vector in km^2/s
% - Specific Energy in km^2/s^2
%Outputs:
% - Eccentricity (e) Vector
% - Semi-major Axis (a) in km
% - Semi-minor Axis (b) in km
% - Semi-latus rectum (l) in km
% - Apoapsis Radii (r_a) in km
% - Periapsis Radii (r_p) in km
% - Orbit Type String

function [e, a, b, l, r_a, r_p, orbit_type] = computeOrbitShape(mu, r, v, h, epsilon)
    % Eccentricity
    e = (cross(v, h) / mu) - (r / norm(r));

    e_mag = norm(e);

    e_check = sqrt(1 + ((2 * epsilon * norm(h)^2) / (mu^2)));
    if abs(e_mag - e_check) > 1e-6
        warning("Eccentricity methods disagree: %.6f vs %.6f", e_mag, e_check);
    end

    % Orbit Type
    if epsilon < 0
        if e_mag < 1 && e_mag > 0
            orbit_type = "Elliptical";

            % Semi-major Axis
            a = -mu / (2*epsilon);

            % Semi-minor Axis
            b = a * sqrt(1-e_mag^2);

            % Semi-latus Rectum
            l = a * (1-e_mag^2);

            % Periapsis and Apoapsis
            r_p = a * (1-e_mag);
            r_a = a * (1+e_mag);
        elseif e_mag == 0
            orbit_type = "Circular";
    
            % Semi-major Axis
            a = norm(r);

            % Semi-minor Axis
            b = a;

            % Semi-latus Rectum
            l = a;

            % Periapsis and Apoapsis
            r_p = a;
            r_a = r_p;
        else
            error("Specific Energy or Eccentricity is erroring")
        end
    elseif epsilon == 0 && e_mag == 1
        orbit_type = "Parabolic";

        % Semi-major Axis
        a = inf;

        % Semi-minor Axis
        b = 0;

        % Semi-latus Rectum
        l = norm(h)^2/mu;

        % Periapsis and Apoapsis
        r_p = l/2;
        r_a = a;
    else 
        if e_mag > 1
            orbit_type = "Hyperbolic";

            % Semi-major Axis
            a = -mu / (2*epsilon);

            % Semi-minor Axis
            b = a * sqrt(1-e_mag^2);

            % Semi-latus Rectum
            l = a * (1-e_mag^2);

            % Periapsis and Apoapsis
            r_p = a * (1-e_mag);
            r_a = a * (1+e_mag);
        else
            error("Specific Energy or Eccentricity is erroring")
        end
    end
end
