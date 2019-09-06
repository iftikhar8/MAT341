%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes value of 2nd degree polynomial
%
% Author: Nick A. Battista
%
% Date: 9/4/19
%
% Institution: The College of New Jersey (TCNJ)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = p1(x)

% x: input independent variable value

% polynomial coefficients (hard coded in)
a0 = 1;
a1 = 1.5;
a2 = 2.5;

% evaluate polynomial at x
val = a0 + a1*x + a2*x^2;

%
% NOTE THAT a0, a1, and a2 are hard coded in. No matter what x is used as
% input, it will always be the same quadratic function.
%