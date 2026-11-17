% Transfer Orbit Shape Helper Function

%Inputs:
% - Gravitational Parameter (mu) in km^3/s^2
% - Semi-perimeter (s) in km
% - Chord length (c) in km
% - Time of Flight (TOF) in seconds
% - Transfer Angle in degrees
%Ouptuts
% - Transfer Orbit Shape
% - Parabolic Time of Flight

function [transfer_orbit_type, TOF_p] = findTransferOrbitType(mu, s, c, TOF, transferAngle);
    if transferAngle < 180
        TOF_p = 1/3 * sqrt(2 / mu) * (s^(3/2) - (s-c)^(3/2));
    else
        TOF_p = 1/3 * sqrt(2 / mu) * (s^(3/2) + (s-c)^(3/2));
    end

    if TOF > TOF_p
        transfer_orbit_type = "Elliptical";
    else
        transfer_orbit_type = "Hyperbolic";
    end

end