%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes value of 2nd degree polynomial
%
% Author: Nick A. Battista
%
% Date: 09/4/19
%
% Institution: The College of New Jersey (TCNJ)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = p2(a0,a1,a2,x)

% INPUTS
% x:        input independent variable value
% a0,a1,a2: polynomial coefficients

% evaluate polynomial at x
val = a0 + a1*x + a2*x^2;

%
% Since coefficients are passed in as input, we can define and evaluate ANY
% quadratic function here!
%