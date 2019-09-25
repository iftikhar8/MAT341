
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes Monte Carlo dice over variety of aspect ratios for
% finding estimating expection of the length between two randomly selected
% points in [0,a]x[0,b]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function compute_Expectation_Lengths_Many_N()

% set a=1 without loss of generality
a = 1;

% create vector of b-Values
bVec = [0.025:0.025:1 1.1:0.1:10];

% initialize storage vector
est_Length_Vec = zeros( size(bVec) );

% set N (# of trials)
N = 2.5e4;

for j=1:length(bVec)
   
    est_Length_Vec(j) = compute_Expected_Value_Line_Segment( N,a,bVec(j) );
    
end

%
% Plotting attributes
%
lw = 5;
fs = 28;
ms = 30;

% Plot to illustrate relationship
plot(bVec/a,est_Length_Vec,'r.','LineWidth',lw,'MarkerSize',ms); hold on; % hold on keeps current info on plot
xlabel('Aspect Ratio');
ylabel('Estimated Length of Segment');
set(gca,'FontSize',fs);