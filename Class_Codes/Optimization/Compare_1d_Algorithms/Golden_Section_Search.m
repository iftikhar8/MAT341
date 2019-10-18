%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: uses the GOLDEN SECTION SEARCH to find an approximate minimum
%           of a function, f(x)
%
% INPUT: tol (specified error tolerance)
%
% RETURNS: N (number of iterations)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Golden_Section_Search( tol )

a = 0;  % lower bound of interval
b = 2;  % upper bound of interval

% set relaxation parameter
tau = ( sqrt(5) - 1 )/2;

x1 = a+(1-tau)*(b-a); % initial lower guess
x2 = a+tau*(b-a);     % initial upper guess

err = 1;     % initialize error to get into while loop
%tol = 1e-14; % initialize error tolerance

% initialize function values
f1 = f(x1);
f2 = f(x2);

% iteration counter
N = 0;

% TEST PLOT THE FUNCTION
%plot_Function(a:(b-a)/1e3:b)
%pause();

while err > tol
    
    % iteration counter
    N = N+1;
    
    if f1 > f2
       
       % reset lower bound (left side) of search interval
       a = x1;
       
       % reset LOWER search value & corresponding function value
       x1 = x2;
       f1 = f2;
       
       % find new UPPER search value
       x2 = a + tau*(b-a);
       f2 = f(x2);
       
    else
       
        % reset upper bound (right side) of search interval
        b = x2;
        
        % reset UPPER search value & corresponding function value
        x2 = x1;
        f2 = f1;
        
        % find new LOWER search value
        x1 = a + (1-tau)*(b-a);
        f1 = f(x1);
        
    end
   
    err = abs(x2-x1);
    
end


fprintf('\n\nIt took %d iterations to achieve %d accuracy\n\n',N,tol);

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