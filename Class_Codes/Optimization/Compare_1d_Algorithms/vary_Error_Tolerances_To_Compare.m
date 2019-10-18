
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: varies error tolerance in the GOLDEN SECTION SEARCH & Successive
%           Parabolic Interpolation to find an approximate minimum of a 
%           function, f(x).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_Compare()

% Vector of error tolerances to try
tol_Vec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10];

for i=1:length(tol_Vec)
   
    % Stores number of iterations it takes to achieve a certain tolerance
    % for Golden Section Search
    IterNumVec_GS(i) = Golden_Section_Search( tol_Vec(i) );

    % Stores number of iterations it takes to achieve a certain tolerance
    % for Successive Parabolic Interpolation
    IterNumVec_SPI(i) = Successive_Parabolic_Interpolation( tol_Vec(i) );


end

% plotting attributes
ms = 30;
lw = 4;
fs = 18;

% plot # of Iterations vs. Error Tolerance
figure(1)
semilogx(tol_Vec,IterNumVec_GS,'b.-','LineWidth',lw,'MarkerSize',ms); hold on;
semilogx(tol_Vec,IterNumVec_SPI,'r.-','LineWidth',lw,'MarkerSize',ms); hold on;
xlabel('error tolerance');
ylabel('# of iterations');
set(gca,'FontSize',fs);
leg=legend('Golden Section','Successive Parabolic Interp.');
set(leg,'FontSize',fs);

% plot # of Iterations vs. Error Tolerance
figure(2)
loglog(tol_Vec,IterNumVec_GS,'b.-','LineWidth',lw,'MarkerSize',ms); hold on;
loglog(tol_Vec,IterNumVec_SPI,'r.-','LineWidth',lw,'MarkerSize',ms); hold on;
xlabel('error tolerance');
ylabel('# of iterations');
set(gca,'FontSize',fs);
leg=legend('Golden Section','Successive Parabolic Interp.');
set(leg,'FontSize',fs);