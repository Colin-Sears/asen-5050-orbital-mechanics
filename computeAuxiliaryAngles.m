% Auxiliary Angle Function

%Inputs:
% - Gravitational Parameter (mu) in km^3/s^2
% - Semi-perimeter (s) in km
% - Chord (c) in km
% - Transfer Angle in degrees [0,360]
%Outputs:
% - Minimum Semi-major Axis (a_min) in km
% - Minimum Time of Flight (TOF_min) in s
% - Minimum Alpha (alpha_min) in rad [0, pi]
% - Minimum Beta (beta_min) in rad [-pi, pi]

function [alpha, beta] = computeAuxiliaryAngles(s, c, a, transferAngle, TOF, TOF_min)
    % Calculate Angles
    alpha = 2 * asin(sqrt(s / (2*a)));
    beta = 2 * asin(sqrt((s - c)  / (2*a)));
    
    % Angle Quadrant Clarification
    if transferAngle < 180
        if TOF < TOF_min
            alpha = alpha;
            beta = beta;
        else
            alpha = 2*pi - alpha;
            beta = beta;
        end
    else
        if TOF < TOF_min
            alpha = alpha;
            beta = -beta;
        else
            alpha = 2*pi - alpha;
            beta = -beta;
        end
    end
end
