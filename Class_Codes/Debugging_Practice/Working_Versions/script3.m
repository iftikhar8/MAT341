%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ******************* WORKING VERSION *************************
%
% FUNCTION: script3: practice debugging
%
% NOTE: 1) script trying to compute SUM_{n=0}^{inf} (1/2)^n
%   
%       2) script will throw errors; fix them.
%
% ******************* WORKING VERSION *************************
%
% PERFORMS: this script finds a series approximation to the
%           geometric series, SUM_{j=0}^inf 1/2^n to within a certain
%           tolerance and returns the number of terms necessary to achieve
%           such tolerance.
%
% NOTE: similar to script1, except continually computes ENTIRE partial 
%       sum each go around in the while-loop (inefficient, but will work)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = script3()

% initializing error tolerance and error to get into while loop
tol = 1e-10;
err = 1;

% initializing partial sum counter, when in while-loop gets bumped to 0.
n = -1;

% NOT AN ERROR, but unnecessary declaration. See Below...
sum = 0;

%
% ERROR: need to flip inequality to get into while-loop, e.g., 
% while err < tol ---> while err > tol
while err > tol
   
    % increment counter
    n = n+1;
    
    % ERROR:need to re-initialize sum to 0 each time we go through the
    % while-loop or else we will add nth partial sum to (n+1)st partial
    % sum and so on..
    sum = 0;
    
    % ERROR: need to evaluate partial sum from ZERO to n.
    %        "computes entire nth partial sum from i=0 to i=n"
    for i=0:n
        % ERROR: need to change 1/2^n to 1/2^i, since incrementing on i in
        %        this for loop to compute partial sum.
        sum = sum + 1/2^i;
    end
    
    % compute error between partial sum and true value of series
    err = abs( sum - 2 );
    
end

% ERROR: must initialize the output named 'val' to something. Here just set
% it equal to number of terms needed to achieve tolerance
val = n;


