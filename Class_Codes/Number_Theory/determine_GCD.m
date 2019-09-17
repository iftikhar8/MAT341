
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: determines GCD of two positive integers (X,Y)
%
%           output: GCD
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function gcd_val = determine_GCD(X,Y)


% first find divisors of both X and Y using previous function
% note: both xDivsVec and yDivsVec are vectors containing ALL divisors > 1
xDivsVec = determine_Divisors(X);
yDivsVec = determine_Divisors(Y);

% initialize gcd to 1 (in case no common divisors!)
gcd_val = 1;

% loop over all divisors of X (starting from lowest to highest)
for i=1:length( xDivsVec )
   
    % specific divisor of X to compare to Y's
    xDiv = xDivsVec(i);
    
    % loop over all divisors of Y (starting from lowest to highest)
    for j=1:length( yDivsVec )
       
        % specific divisor of Y to compare specific X
        yDiv = yDivsVec(j);
        
        % compare divisors
        if xDiv == yDiv
           
            % if both have same divisor, store it!
            gcd_val = xDiv; 
            
        end
                
    end
    
end