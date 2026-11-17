% Kepler's Function v1

%Inputs:
% - Version of Kepler's equation (Elliptical or Hyperbolic)
% - Mean Anomaly (M) in radians
% - Eccentricity (e)
% - Eccentric Anomaly, which the function iterates to find
%Outputs:
% - Function for fsolve use

function F = keplersFunction(version, E, M, e)
    e_mag = norm(e);

    switch version
        case "Elliptical"
            F = E - e_mag*sin(E) - M;
        case "Hyperbolic"
    end
end