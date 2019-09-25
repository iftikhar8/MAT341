%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: finds partial sums of e^x
%
% Author: Nick A. Battista
%
% Date: 08/20/19
%
% Institution: The College of New Jersey (TCNJ)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = approx_Exp_Taylor_Series(N,x)

% INPUTS
% N: number of terms in Taylor Series
% x: value to evaluate Taylor Series

% Initialize
val = 0;

for i=1:N
    
    val = val + x^(i-1)/factorial(i-1);
    
end

