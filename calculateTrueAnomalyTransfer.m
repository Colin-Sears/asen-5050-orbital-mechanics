% Calculate True Anomalies along Transfer Orbit

%Inputs:
% - Position Vectors
% - Transfer Orbit Semi-latus Rectum (p) in km
% - Transfer Angle in degrees
%Outputs:
% - True Anomaly at position 1 on the Transfer Orbit in degrees
% - True Anomaly at position 2 on the Transfer Orbit in degrees

function[theta_star_1, theta_star_2] = calculateTrueAnomalyTransfer(r_1, r_2, p, transferAngle)    
    ecos1 = p/norm(r_1) - 1;
    ecos2 = p/norm(r_2) - 1;
    
    esin1 = (ecos1*cosd(transferAngle) - ecos2) / sind(transferAngle);

    % Calculate True Anomalies
    theta_star_1 = atan2d(esin1, ecos1);
    theta_star_2 = theta_star_1 + transferAngle;
end

