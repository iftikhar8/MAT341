%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: figures out how many terms we need in a series that converges
%           to pi to within a desired accuracy (tolerance)
%           
%           Note: 1. using a series that CONVERGES SLOWLY
%                 2. this script runs faster bc got rid of for-loop in
%                    while loop and uses knowledge of previous partial sum
%                    to simply tack on additional term each while-loop
%                    iteration
%
%     Series comes from: arctan(x) = SUM_{j=0}^inf (-1)^n x^(2n+1) / (2n+1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function pi_While_Loop_Faster()

% set error tolerance desired
tol=1e-8;

% initialize error to get into while-loop
err=1;

% initialize to zero
sum= 0;

% initialized to -1 so pop into while loop gives N=0
N=-1;    

while err > tol
    
    % bump up partial sum order by 1
    N = N+1;
    
    % find pi approx
    sum = sum + 4*(-1)^(N) / (2*N+1); 
    
    % compute error
    err = abs( sum - pi );
    
    
end

N