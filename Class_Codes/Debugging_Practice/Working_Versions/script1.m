%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ******************* WORKING VERSION *************************
%
% FUNCTION: script1: practice debugging
%
% NOTE: 1) try to figure out what this script is doing 
%          (it is only uncommented for this reason)
%   
%       2) script will throw errors; fix them.
%
% ******************* WORKING VERSION *************************
%
% PERFORMS: this script finds a series approximation to the
%           geometric series, SUM_{j=0}^inf 1/2^n to within a certain
%           tolerance and returns the number of terms necessary to achieve
%           such tolerance
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = script1()

% initializing error tolerance and error to get into while loop
tol = 1e-10;
err = 1;

% initializing partial sum counter, when in while-loop gets bumped to 0.
n = -1;

% ERROR: need to initialize sum to 0 so when called in while-loop it has an
% initial value
sum = 0;

%
% ERROR: need to flip inequality to get into while-loop, e.g., 
% while err < tol ---> while err > tol
while err > tol
   
    % increment counter
    n = n+1;
    
    % add additional term onto sum each go through while-loop
    sum = sum + 1/2^n;
    
    % compute error between partial sum and true value of series
    err = abs( sum - 2 );
    
end

% ERROR: must initialize the output named 'val' to something. Here just set
% it equal to number of terms needed to achieve tolerance
val = n;



