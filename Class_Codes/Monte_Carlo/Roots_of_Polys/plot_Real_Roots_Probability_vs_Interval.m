%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes Monte Carlo dice over variety interval sizes for how
%           likely it is to randomly sample quadratic coefficients 
%           a,b,c \in [-L,L] and get real roots
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Real_Roots_Probability_vs_Interval()

% set # of trials
N = 1e5;

% create vector of L values
LVec = [1e-3:0.5e-3:9e-3 1e-2:0.5e-2:9e-2 1e-1:0.5e-1:9e-1 1e0:0.5e0:10];

% initiate storage vector for estimated probabilities
probVec = zeros( size(LVec) );

for j=1:length(LVec)
   
    probVec(j) = estimate_Real_Roots_Quadratic( N, LVec(j) );
    
end

%
% Plotting attributes
%
lw = 5;
fs = 28;
ms = 30;

% Plot to illustrate relationship
semilogx(LVec,probVec,'r.','LineWidth',lw,'MarkerSize',ms); hold on; % hold on keeps current info on plot
xlabel('Size of Interval [-L,L], L');
ylabel('Estimated Probability of Real Roots');
set(gca,'FontSize',fs);