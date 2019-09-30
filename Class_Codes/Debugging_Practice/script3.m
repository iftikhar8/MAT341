%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: script3: practice debugging
%
% NOTE: 1) script trying to compute SUM_{n=0}^{inf} (1/2)^n
%   
%       2) script will throw errors; fix them.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = script3()

tol = 1e-10;

err = 1;

sum = 0;

n = -1;

while err < tol
   
    n = n+1;
    
    for i=1:n
        sum = sum + 1/2^n;
    end
    
    err = abs( sum - 2 );
    
end


