% Celestial Parameter Store v1

%Input: String, Celestial Body
%Output: 
% - Gravitational Parameter (mu) in km^3/s^2
% - Altitude (R) in km

function [mu, R] = getCelestialParameters(centralBody)
    switch centralBody
        case "sun"
            mu = 1.32712428 * 10^11;
            R = 0;
        case "mercury"
            mu = 2.2042 * 10^4;
            R = 2439.0;
        case "venus"
            mu = 3.257 * 10^4;
            R = 6052.0;
        case "earth"
            mu = 3.986004415 * 10^5;
            R = 6378.1363;
        case "moon"
            mu = 4902.799;
            R = 1738.0;
        case "mars"
            mu = 4.305 * 10^4;
            R = 3397.2;
        case "jupiter"
            mu = 1.268 * 10^8;
            R = 71492.0;
        case "saturn"
            mu = 3.794 * 10^7;
            R = 60268.0;
        case "uranus"
            mu = 5.794 * 10^6;
            R = 25559.0;
        case "neptune"
            mu = 6.809 * 10^6;
            R = 24764.0;
        case "pluto"
            mu = 900.0;
            R = 1151.0;
    end
end