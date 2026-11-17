% Space Triangle Function

%Inputs:
% - Position Vector 1
% - Position Vector 2
% - Orbit Transfer Type (Short/Long)
%Outputs:
% - Transfer Angle (del_theta_star) in degrees [0, 360]
% - Chord length (c) in km
% - Semi-perimeter (s) in km
% - Minimum Semi-major Axis (a_min) in km

function [transferAngle, c, s] = computeSpaceTriangle(r_1, r_2, transferType)
    r_1_mag = norm(r_1);
    r_2_mag = norm(r_2);

    % Transfer Angle
    transferAngle = acosd(dot(r_1, r_2) / (norm(r_1) * norm(r_2)));
    if transferType == "long"
        transferAngle = 360 - transferAngle;
    end
   
    % Chord Length
    c = sqrt(r_1_mag^2 + r_2_mag^2  - 2*r_1_mag*r_2_mag*cosd(transferAngle));

    % Semi-perimeter
    s = 1/2 * (r_1_mag + r_2_mag + c);
end
