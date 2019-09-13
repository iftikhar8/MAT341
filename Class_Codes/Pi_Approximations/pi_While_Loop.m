
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: figures out how many terms we need in a series that converges
%           to pi to within a desired accuracy (tolerance)
%           
%           Note: using a series that CONVERGES SLOWLY
%
%     Series comes from: arctan(x) = SUM_{j=0}^inf (-1)^n x^(2n+1) / (2n+1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function pi_While_Loop()

% set error tolerance desired
tol=1e-4;

% initialize error to get into while-loop
err=1;

% initialized to -1 so pop into while loop gives N=0
N=-1;    

while err > tol
   
    % initialize to zero so not adding previous partial sum to new approximation
    sum = 0;
    
    % bump up partial sum order by 1
    N = N+1;
    
    % find pi approx (this for-loop SLOWS down the code dramatically)
    for i=0:N
       sum = sum + 4*(-1)^(i) / (2*i+1); 
    end
    
    % compute error
    err = abs( sum - pi );
    
    
end

N

