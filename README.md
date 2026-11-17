# Orbital Mechanics MATLAB Toolkit

A library of MATLAB functions for two-body orbital mechanics. I wrote it during **ASEN 5050 – Space Flight Dynamics** at the University of Colorado Boulder (Continuing Education, Astrodynamics and Satellite Navigation Systems), Fall 2026.

The functions are small, single-purpose building blocks. I chain them together to solve problems like converting a state vector to orbital elements, solving Lambert's problem between two ephemeris states, building Earth–Mars porkchop plots, and planning relative-motion maneuvers with the Clohessy–Wiltshire equations.

All quantities use **km, km/s, and seconds**. Angles are in **degrees** unless a function's header says radians.

## Functions

### Orbital elements from a state vector

| Function | Purpose |
|---|---|
| `computeOrbitalElements(mu, r, v)` | Returns a struct with the full element set: h, energy, e, a, b, p, r_a, r_p, i, RAAN, AoP, true/eccentric/mean anomaly, argument of latitude, true longitude, mean motion, period, and orbit type |
| `computeOrbitShape` | Eccentricity vector, a, b, semi-latus rectum, apsides, and orbit classification (circular / elliptical / parabolic / hyperbolic) |
| `computeOrbitTime` | Mean motion and period |
| `computeOrbitEpoch` | True, eccentric/hyperbolic, and mean anomaly at epoch |
| `computeOrbitRotation` | Inclination, RAAN, argument of periapsis, true longitude of periapsis, argument of latitude, true longitude |
| `convertAnomaly` | True → eccentric (or hyperbolic) and mean anomaly |

### Kepler's equation

| Function | Purpose |
|---|---|
| `keplersEquationFunction` | Newton–Raphson solver for the eccentric anomaly given time past periapsis (elliptical orbits) |
| `keplersFunction` | Residual of Kepler's equation, for use with `fsolve` |
| `keplersInitialGuess` | Initial guess for the eccentric anomaly |

### Lambert's problem

| Function | Purpose |
|---|---|
| `computeSpaceTriangle` | Transfer angle, chord, and semi-perimeter for short- or long-way transfers |
| `findTransferOrbitType` | Parabolic time of flight, used to classify the transfer as elliptical or hyperbolic |
| `computeMinimumEnergyTransfer` | Minimum-energy semi-major axis, time of flight, and α/β |
| `computeAuxiliaryAngles` | Lagrange's α and β with quadrant resolution |
| `lambertsFunction` | Time-of-flight residual in a, for use with `fsolve` |
| `calculateTrueAnomalyTransfer` | True anomalies at departure and arrival on the transfer orbit |
| `calculateLagrangeCoef` | f, g, ḟ, ġ Lagrange coefficients |
| `calculateVelocityTransfer` | Departure and arrival velocity vectors from f and g |

### Relative motion

| Function | Purpose |
|---|---|
| `getHCWState(n, t)` | Clohessy–Wiltshire state transition sub-matrices Φ_rr, Φ_rv, Φ_vr, Φ_vv |

### Utilities

| Function | Purpose |
|---|---|
| `getCelestialParameters(body)` | Gravitational parameter and radius for the Sun, the planets, the Moon, and Pluto |
| `readEphemeris(file)` | Reads a JPL Horizons vector-table export into Julian dates, positions, and velocities |

## Example: Lambert transfer between two states

```matlab
[mu, ~] = getCelestialParameters("sun");
opts = optimoptions('fsolve', 'FunctionTolerance', 1e-8, 'StepTolerance', 1e-8, 'Display', 'off');

[transferAngle, c, s] = computeSpaceTriangle(r_1, r_2, "short");
[a_min, TOF_min]      = computeMinimumEnergyTransfer(mu, s, c, transferAngle);

a = fsolve(@(a) lambertsFunction(mu, s, c, a, transferAngle, TOF, TOF_min), a_min, opts);
[alpha, beta] = computeAuxiliaryAngles(s, c, a, transferAngle, TOF, TOF_min);

p = (4*a*(s - norm(r_1))*(s - norm(r_2))/c^2) * sin((alpha + beta)/2)^2;

[f, g, f_dot, g_dot] = calculateLagrangeCoef(mu, r_1, r_2, transferAngle, p);
[v_t1, v_t2]         = calculateVelocityTransfer(r_1, r_2, f, g, f_dot, g_dot);
```

To make a porkchop plot, run this in a loop over departure and arrival dates read with `readEphemeris`, then contour the departure and arrival v∞ values.

## Requirements

MATLAB R2020b or newer. The `fsolve` workflows also need the Optimization Toolbox.

## Known limitations

- The Kepler solvers handle elliptical orbits only. The hyperbolic branch is not implemented yet.
- The Lambert functions solve single-revolution, elliptical transfers.
