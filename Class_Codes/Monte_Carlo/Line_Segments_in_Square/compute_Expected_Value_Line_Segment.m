
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes Monte Carlo probability estimate of average length
%           between two randomly chosen points in [0,a]x[0,b]
%
%           Inputs: (1) N: # of trials to perform for averaging
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function exp_Length = compute_Expected_Value_Line_Segment(N,a,b)

% initialize storage for lengths
dVec = zeros(1,N);

for n=1:N
        
    x1 = a*rand(1);
    y1 = b*rand(1);
    
    x2 = a*rand(1);
    y2 = b*rand(1);
    
    dist = sqrt( (x1-x2)^2 + (y1-y2)^2 );
    
    dVec(n) = dist;
    
end

% compute expected length
exp_Length = mean(dVec);