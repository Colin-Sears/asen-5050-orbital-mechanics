% Transfer Velocity Calculator from Lagrange Coefficients v1

%Inputs:
% - Lagrange Coefficients (f, g, f_dot, g_dot)
% Outputs:
% - Transfer Velocity Vectors in km/s

function [velocity_1, velocity_2] = calculateVelocityTransfer(r_1, r_2, f, g, f_dot, g_dot)
    velocity_1 = (r_2 - f*r_1) / g;
    velocity_2 = f_dot*r_1 + g_dot*velocity_1;
end