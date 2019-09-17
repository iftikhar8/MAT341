
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: determines divisors of a given positive integer, N
%
%           output: list of divisors (order: lowest -> highest)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function divisorsVEC = determine_Divisors(N)

% inputs:   1. N: positive integer

% initialize counter to 0
ct = 0;

%loop over every positive integer from  2,...,CEILING( sqrt(N) )
for i=2:ceil( N/2 )

    % test to see if  "N mod i" is 0 or not (if 0, is not prime)
    if mod(N,i) == 0

        % increment counter for divisor storage
        ct = ct+1;
        
        % store value of divisor in vector
        divisorsVEC(ct) = i;
           
    end

end

% tack of additional value of number itself!
divisorsVEC(ct+1) = N;