%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: uses the GOLDEN SECTION SEARCH to find an approximate minimum
%           of a function, f(x)
%
% INPUT: tau (relaxation parameter)
%
% RETURNS: N (number of iterations)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Golden_Section_Search_Input_Tau(tau)

a = 0;  % lower bound of interval
b = 2;  % upper bound of interval

x1_aux = a+(1-tau)*(b-a); % initial lower guess
x2_aux = a+tau*(b-a);     % initial upper guess

% Keep convention that x1<x2
x1 = min(x1_aux,x2_aux);
x2 = max(x1_aux,x2_aux);

err = 1;     % initialize error to get into while loop
tol = 1e-14; % initialize error tolerance

% initialize function values
f1 = f(x1);
f2 = f(x2);

% iteration counter
N = 0;

% TEST PLOT THE FUNCTION
plot_Function(a:(b-a)/1e3:b)

while err > tol
    
    % iteration counter
    N = N+1;
    
    if f1 > f2
       
        % reset lower bound (left side) of search interval
        a = x1;
       
    elseif f1 <= f2
       
        % reset upper bound (right side) of search interval
        b = x2;
 
    end
                
    % reset search value & corresponding function value
    x1_aux = a + (1-tau) * (b-a);
    x2_aux = a + tau * (b-a);

    % keep convention of x1<x2
    x1=min(x1_aux,x2_aux);
    x2=max(x1_aux,x2_aux);

    % find new LOWER search value
    f1 = f(x1);
    f2 = f(x2);
   
    % compute new error*
    err = b-a;
    
end

fprintf('\n\nIt took %d iterations to achieve %d accuracy\n',N,tol);
fprintf('\n\nMinimum at: xMin = %d\n',x1);
fprintf('\nMinimum Value: f(xMin) = %d\n\n',f(x1));

err

% a
% x1
% x2
% b
% pause();



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: plots the function f(x)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Function(xVec)

% initialize storage vector y
yVec = zeros( size( xVec ) );

for i=1:length(xVec)
    
    yVec(i) = f( xVec(i) );
    
end

% plotting attributes
ms = 30;
lw = 4;
fs = 18;

% Plots the function, f(x) 
plot(xVec,yVec,'.','LineWidth',lw,'MarkerSize',ms); hold on;
xlabel('x');
ylabel('y');
set(gca,'FontSize',fs);
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes function f(x) evaluated at input x
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)

val = 0.5 - x*exp( -x^2 );