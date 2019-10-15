%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: uses the GOLDEN SECTION SEARCH to find an approximate minimum
%           of a function, f(x)
%
% INPUT: tol (specified error tolerance)
%
% RETURNS: N (number of iterations)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Successive_Parabolic_Interpolation(tol)

a = 0;  % lower bound of interval
b = 2;  % upper bound of interval


x3 = 0.0;   % define first point ("oldest point")
x2 = 0.6;   % define second point ("second oldest point")
x1 = 1.2;   % define third point ("newest point")

err = 1;     % initialize error to get into while loop

% initialize function values
f3 = f(x3);
f2 = f(x2);
f1 = f(x1);

% iteration counter
N = 0;

while err > tol
   
    % increment counter
    N = N+1;
    
    % Fill Matrix
    A(1,:) = [x1^2 x1 1]; % fill first row of matrix
    A(2,:) = [x2^2 x2 1]; % fill second row of matrix
    A(3,:) = [x3^2 x3 1]; % fill third row of matrix
    
    % Vector of Function Values 
    bVec(1) = f(x1);
    bVec(2) = f(x2);
    bVec(3) = f(x3);
    
    % Compute coefficients of parabola (invert linear system)
    quadCoeffs = inv(A) * bVec';
    
    % Store coefficients of Parabola
    a = quadCoeffs(1); % coefficient on 'ax^2' term of parabola
    b = quadCoeffs(2); % coefficient on 'bx' term of parabola
    c = quadCoeffs(3); % not needed -> constant 'c' term of parabola
    
    % Redefine points
    x3 = x2;       % Previous 2nd point is now oldest
    x2 = x1;       % Previous newest point is now second oldest
    x1 = -b/(2*a); % Root of parabola is newest point
    
    % Compute Error
    err = abs(x3-x1);
    
end

fprintf('\n\nIt took %d iterations to achieve %d accuracy\n\n',N,tol);

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes function f(x) evaluated at input x
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)

val = 0.5 - x*exp( -x^2 );