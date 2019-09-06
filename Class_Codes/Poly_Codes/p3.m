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

function val = p3(a,x)

% INPUTS
% x: input independent variable value
% a: vector of polynomial coefficients

% Explicitly define polynomial coefficients from input vector 'a'
a0 = a(1);
a1 = a(2);
a2 = a(3);

% evaluate polynomial at x
val = a0 + a1*x + a2*x^2;

% or equivalent evaluation without explicitly defining a0,a1,a2 and keeping
%    in terms of the input vector 'a'
val = a(1) + a(2)*x + a(3)*x^2;

%
% Since coefficients are passed in as input, we can define and evaluate ANY
% quadratic function here!
%