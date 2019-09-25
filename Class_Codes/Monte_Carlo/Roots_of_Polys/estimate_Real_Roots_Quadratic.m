%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: estimates probability real roots of quadratic ax^2+bx+c = 0, if
%           a,b,c randomly sampled from [-L,L]
%
%           input: (1) N: # of trials
%                  (2) L: length of the interval to sample [-L,L]
%
%           returns: prob: estimated probability
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function est_prob = estimate_Real_Roots_Quadratic(N,L)

count_Real = 0;

for i=1:N
   
    % sample [-1,1] for quadratic coefficients
    a = 2*L*rand()-L;
    b = 2*L*rand()-L;
    c = 2*L*rand()-L;
   
    % compute 1 root of quadratic
    root1 = ( -b + sqrt( b^2 - 4*a*c ) ) / (2*a);
    
    % check if imaginary part is zero. If so, increment counter.
    if imag( root1 ) == 0
        count_Real = count_Real + 1;
    end
    
end

est_prob = count_Real / N;
