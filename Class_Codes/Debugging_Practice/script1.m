%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: script1: practice debugging
%
% NOTE: 1) try to figure out what this script is doing 
%          (it is only uncommented for this reason)
%   
%       2) script will throw errors; fix them.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = script1()

tol = 1e-10;
err = 1;

n = -1;

while err < tol
   
    n = n+1;
    
    sum = sum + 1/2^n;
    
    err = abs( sum - 2 );
    
end



