% Kepler's Initial Guess Helper Function

%Inputs:
% - Version of Kepler's equation (Elliptical or Hyperbolic)
% - Mean Anomaly (M) in radians
% - Eccentricity (e)
%Outputs:
% - Initial Eccentric/Hyperbolic Anomaly for solving Kepler's Equation

function [E_0] = keplersInitialGuess(version, M, e)
    e_mag = norm(e);

    switch version
        case "Elliptical"
            M = mod(M, 2*pi);
            if M > 0 && M < pi %0 < M < pi
                E_0 = M + e_mag;
            else 
                E_0 = M - e_mag; 
            end    
        case "Hyperbolic"
    end
end