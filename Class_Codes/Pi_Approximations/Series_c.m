%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: compute partial sums series approximation for pi
%           using a series that CONVERGES QUICKLY!
%
%     Series comes from: arctan(x) = SUM_{j=0}^inf (-1)^n x^(2n+1) / (2n+1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Series_c(N)

% input: N -> Nth partial sum

% initialize sum
sum = 0;

for n=0:N
    sum = sum + 6*(-1)^(n)* (1/sqrt(3))^(2*n+1) / (2*n+1);
end

% store pi_approximation as named variable
pi_approx = sum;

% check error
error = abs( pi_approx - pi )
