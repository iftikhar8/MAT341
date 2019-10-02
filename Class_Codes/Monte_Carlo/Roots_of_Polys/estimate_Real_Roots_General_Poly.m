%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: estimates probability real roots of quadratic ax^2+bx+c = 0, if
%           a,b,c randomly sampled from [-L,L]
%
%           input: (1) N: # of trials
%                  (2) deg: degree of polynomial to test
%
%           returns: prob: estimated probability
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function est_prob = estimate_Real_Roots_General_Poly(N,deg,L)

count_Real = 0;

for i=1:N
   
    % sample [-1,1] for quadratic coefficients
    coeffs = 2*L*rand(deg+1,1)-L;
   
    % compute roots of polynomial using MATLAB built in poly roots solver
    rootz = roots( coeffs );
    
    % check if imaginary part is zero. If so, increment counter.
    if max( abs( imag( rootz ) ) ) == 0
        count_Real = count_Real + 1;
    end
    
end

est_prob = count_Real / N;
