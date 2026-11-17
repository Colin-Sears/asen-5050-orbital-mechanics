% Clohessy-Wiltshire State Matrix

% Inputs:
% - Mean Motion (n) in rad/s
% - Time (t) in seconds
% Outputs:
% - 4 State Transformation Matricies

function [phi_rr, phi_rv, phi_vr, phi_vv] = getHCWState(n, t)

c = cos(n*t);
s = sin(n*t);

phi_rr = [4-3*c, 0 ,0; ...
        6*(s - n*t), 1, 0;...
        0, 0, c;];

phi_rv = [s/n, 2/n * (1-c) ,0; ...
        2/n * (c-1), 4/n * s - 3*t, 0;...
        0, 0, s/n];

phi_vr = [3*n*s, 0, 0; ...
          6*n*(c-1), 0, 0; ...
          0, 0, -n*s];

phi_vv = [c, 2*s, 0; ...
          -2*s, 4*c-3, 0; ...
          0, 0, c];