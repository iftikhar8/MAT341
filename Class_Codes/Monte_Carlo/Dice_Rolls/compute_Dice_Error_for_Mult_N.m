
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes Monte Carlo dice error for numerous numbers of rolls
%           and plots the error vs. number of rolls
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function compute_Dice_Error_for_Mult_N()

NVec = [1:1:10 15:2.5:100 150:25:1000 1500:250:10000 20000:2500:100000 1.5e5:2.5e4:6e5];

for j=1:length(NVec)
   
    errVec(j) = estimate_Dice_Probability( NVec(j) );
    
end

%
% Plotting attributes
%
lw = 5;
fs = 28;
ms = 30;

% Log-Log plot to illustrate relationship
loglog(NVec,errVec,'r.','LineWidth',lw,'MarkerSize',ms); hold on; % hold on keeps current info on plot
xlabel('# of die rolls');
ylabel('Error');
set(gca,'FontSize',fs);