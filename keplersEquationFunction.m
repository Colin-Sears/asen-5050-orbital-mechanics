% Numerical Kepler's Equation Function v1

%v2: Hyperbolic method using Algorithm 4, fzero method for solving

function [anom, it] = keplersEquationFunction(version, t_p, a, e, mu)
    % Initialize Solver Parameters
    it = 0;
    it_max = 50;
    
    tol = 1e-8;

    % Calculate Mean Anomaly
    n = sqrt(mu / abs(a)^3);
    M = n * t_p;

    % Kepler's Equation
    switch version
        case "Elliptical"         
            % Initial Guess
            M = mod(M, 2*pi); %wrap M to [0, 2*pi) for a simpler ifelse check
            if M > 0 && M < pi %0 < M < pi
                anom = M + e;
            else 
                anom = M - e; 
            end    

            % Numerically Solve
            while it < it_max
                g = M - anom + e*sin(anom);
                g_prime = -1 + e*cos(anom);
                
                % Calculate update term to check convergence
                anom_1 = anom - g/g_prime;

                % Check for Convergence
                if abs(anom_1 - anom) < tol
                    break;
                end
    
                % Update term
                anom = anom_1;
                
                % Increment iteration variable to prevent infinite convergence
                it = it + 1;
            end 
        case "Hyperbolic"
            % Calculate & Set Initial Guess
            
            % Numerically Solve
            while it < it_max
                % Check for Convergence

                % Update term

                % Increment iteration variable to prevent infinite convergence
                it = it + 1;
            end 
    end
    
    % Check if solver was unable to converge within maximum iterations set
    if it >= it_max
        warning('Kepler solver hit %d iterations without converging', it_max);
    end

end
