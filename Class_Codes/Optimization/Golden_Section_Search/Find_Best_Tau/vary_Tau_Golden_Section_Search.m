
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: varies parameter tau in the GOLDEN SECTION SEARCH to find 
%           an approximate minimum of a function, f(x).
%
%           Tries to find best tau value for minimal number of search terms
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Tau_Golden_Section_Search()

% Vector of tau values to try
tau_Vec = 0.05:0.005:0.95;

for i=1:length(tau_Vec)
   
    % Stores number of iterations to achieve 1e-13 accuracy for each tau
    %        value in vector tau_Vec
    IterNumVec(i) = Golden_Section_Search_Input_Tau( tau_Vec(i) );

end

% plotting attributes
ms = 30;
lw = 4;
fs = 18;

% plot # of Iterations vs. tau value
figure(2)
semilogy(tau_Vec,IterNumVec,'.-','LineWidth',lw,'MarkerSize',ms);
xlabel('tau');
ylabel('# of iterations');
set(gca,'FontSize',fs);

