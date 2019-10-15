
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: varies error tolerance in the GOLDEN SECTION SEARCH to find 
%           an approximate minimum of a function, f(x).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerance_Golden_Section_Search()

% Vector of error tolerances to try
tol_Vec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-11 1e-12 1e-13 1e-14];

for i=1:length(tol_Vec)
   
    % Stores number of iterations it takes to achieve a certain tolerance
    IterNumVec(i) = Golden_Section_Search( tol_Vec(i) );

end

% plotting attributes
ms = 30;
lw = 4;
fs = 18;

% plot # of Iterations vs. Error Tolerance
semilogx(tol_Vec,IterNumVec,'.-','LineWidth',lw,'MarkerSize',ms);
xlabel('error tolerance');
ylabel('# of iterations');
set(gca,'FontSize',fs);