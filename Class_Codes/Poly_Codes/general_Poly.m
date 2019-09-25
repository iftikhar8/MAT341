%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes general polynomial
%
% Author: Nick A. Battista
%
% Date: 9/4/19
%
% Institution: The College of New Jersey (TCNJ)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = general_Poly(a,x)

% INPUTS
% x: input independent variable value
% a: vector of polynomial coefficients

% length of poly coefficient vector (poly has order N-1)
N = length(a);

% initialization 
val = 0;

%
% evaluate polynomial at x via a for-loop to loop over every coefficient
% and multiply by appropriate power of x
%
for i=1:N
 
    val = val + a(i)*x^(i-1);
    
end


