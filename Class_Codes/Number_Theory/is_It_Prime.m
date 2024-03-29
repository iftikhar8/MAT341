
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: tests to see if a number is prime or not
%
%           NOTE: for VERY large integers, MATLAB's modular arithmetic breaks down! 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function is_It_Prime(N)

% inputs:   1. N: positive integer


%
% METHOD 1: use a for-loop and break statement if number isn't prime!
%

% loop over every positive integer from  2,...,CEILING( sqrt(N) )
% for i=2:ceil( sqrt(N) )
%    
%     % test to see if  "N mod i" is 0 or not (if 0, is not prime)
%     if mod(N,i) == 0
%        
%         % prints to screen that number isn't prime
%         fprintf('\n\nNumber is not prime!\n');
%         fprintf('It is divisible by %d!\n\n',i);
%         
%         % break statement -> exists the for-loop
%         break;
%         
%     end
%     
% end


%
% METHOD 2: use a while-loop 
%

% initialize 0 or 1 variable to get into loop (no divisors have been found yet)
divisor_YN = 0; 

% initialize integer to 2 to test if factor of N
i = 2;

% while loop -> keep iterating until i >= CEIL( sqrt(N) )
while divisor_YN == 0
    
    if mod(N,i) == 0
        
        % prints to screen that number isn't prime
        fprintf('\n\nNumber is not prime!\n');
        fprintf('It is divisible by %d!\n\n\n',i);
    
        divisor_YN = 1;
        
    end
    
    % if testing variable i > ceil( sqrt(N) ), N must be prime.s
    if i > ceil( sqrt(N) )
    
        divisor_YN = -1;
        
    end
    
    % increment counter
    i = i+1;
  
end

if divisor_YN == -1
   
    fprintf('\n\nNumber is prime!\n\n\n');

end
