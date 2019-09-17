
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: compare sums: a_n = SUM_{j=1}^n^2 n / (n^2+j^2)
%
%       FINDS: smallest possible integer N such that |a_{n-1}-a_n| <= 0.01
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Series_Compare()

% set error tolerance for while-loop
tol = 1e-2;

% initialize the error to get into loop
err = 1;

% n: initialize counter
n=1;

% find a_1
a_n(1) = compute_an(1);


% perform while-loop to keep computing a_n's until condition is satisfied
while err > tol
    
    %increment counter
    n = n+1;
    
    % compute series for next value of n (e.g, current value of 'n' in while-loop)
    a_n(n) = compute_an(n);
    
    % compute error
    err = abs( a_n(n-1) - a_n(n) );
   
end

% store smallest integer N that achieves the condition
N=n


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes the summation: SUM_{j=1}^n^2 n / (n^2 + j^2)
%
%       returns: value of above summation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function sum = compute_an(n)

% initialize sum
sum = 0;

% compute series
for j=1:n^2
    
    sum = sum + n / (n^2 + j^2);
    
end