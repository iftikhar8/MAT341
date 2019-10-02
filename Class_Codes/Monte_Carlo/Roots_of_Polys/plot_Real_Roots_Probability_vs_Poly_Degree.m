%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes Monte Carlo dice over variety interval sizes for how
%           likely it is to randomly sample quadratic coefficients 
%           a,b,c \in [-L,L] and get real roots
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Real_Roots_Probability_vs_Poly_Degree()

% set # of trials
N = 2e5;

% create vector of L values
degVec = 0:1:6;

% initiate storage vector for estimated probabilities
probVec = zeros( size(degVec) );

for j=1:length(degVec)
   
    probVec(j) = estimate_Real_Roots_General_Poly( N, degVec(j), 0.25 );
    
end

probVec'

%
% Plotting attributes
%
lw = 5;
fs = 28;
ms = 30;

% Plot to illustrate relationship
semilogy(degVec,probVec,'b.','LineWidth',lw,'MarkerSize',ms); hold on; % hold on keeps current info on plot
xlabel('Polynomial Degree');
ylabel('Estimated Probability of Real Roots');
set(gca,'FontSize',fs);