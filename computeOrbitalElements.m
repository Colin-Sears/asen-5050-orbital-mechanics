% Orbital Element Calculator Function v1

%v1 only Inertial Frame Keplerian Elements
%v2 Spherical Elements, Equinoctial Elements, Delaunay Variables

%Input:
% - Gravitational Parameter (mu) in km^3/s^2
% - Position Vector in km
% - Velocity Vector in km/s
%Outputs:
% - Specific Angular Momentum Vector in km^2/s
% - Specific Energy in km^2/s^2
% - Eccentricity (e) as a vector
% - Semi-major Axis (a) in km
% - Semi-minor Axis (b) in km
% - Semi-latus rectum (l) in km
% - Apoapsis Radii (r_a) in km
% - Periapsis Radii (r_p) in km
% - Orbit Type as a string
% - Inclination (i) in degrees [0, 180]
% - RAAN (Omega) in degrees [-180, 180]
% - Argument of Periapsis (omega) in degrees [-180, 180]
% - True Longitude of Periapsis (omega_true) in degrees [-180, 180]
% - Line of Nodes (lon) as a vector
% - Mean Motion (n) in s
% - Orbit Period (p) in s
% - True Anomaly in degrees [-180,180]
% - Eccentric/Hyperbolic Anomaly in radians [0, 2pi]
% - Mean Anomaly in radians [0, 2pi]
% - Argument of Latitude (u) in degrees [-180, 180]
% - True Longitude (lambda_true) in degrees [-180, 180]

function oe = computeOrbitalElements(mu, r, v)
    % Specific Angular Momentum (km^2/s)
    oe.h = cross(r, v);

    % Specific Energy (km^2/s^2)
    oe.epsilon = (norm(v)^2 / 2) - (mu / norm(r));

    % Size & Shape Elements
    [oe.e, oe.a, oe.b, oe.l, oe.r_a, oe.r_p, oe.orbit_type] = computeOrbitShape(mu, r, v, oe.h, oe.epsilon);

    % Time Elements
    [oe.n, oe.p] = computeOrbitTime(mu, oe.a, oe.l);

    % Epoch Elements
    [oe.theta_star, oe.E, oe.M] = computeOrbitEpoch(r, v, oe.e, oe.orbit_type);

    % Rotational Elements
    [oe.i, oe.Omega, oe.omega, oe.omega_true, oe.u, oe.lambda_true, oe.lon] = computeOrbitRotation(oe.h, oe.e, oe.theta_star);
end