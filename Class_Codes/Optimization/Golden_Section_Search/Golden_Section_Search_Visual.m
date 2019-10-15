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

function N = Golden_Section_Search_Visual()

a = 0;  % lower bound of interval
b = 2;  % upper bound of interval

aOrig = a; % for plotting
bOrig = b; % for plotting

% set relaxation parameter
tau = ( sqrt(5) - 1 )/2;

x1 = a+(1-tau)*(b-a); % initial lower guess
x2 = a+tau*(b-a);     % initial upper guess

err = 1;     % initialize error to get into while loop
tol = 1e-6;  % initialize error tolerance

% initialize function values
f1 = f(x1);
f2 = f(x2);

% iteration counter
N = 0;

% TEST PLOT THE FUNCTION
flag = 0;
plot_Function(a:(b-a)/1e3:b,x1,x2,flag);
pause();
flag = 1;
plot_Function(a:(b-a)/1e3:b,x1,x2,flag);
pause();
clf;

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
    
    plot_Function(aOrig:(bOrig-aOrig)/1e3:bOrig,x1,x2,flag);
    pause();
    clf;
    
end


fprintf('\n\nIt took %d iterations to achieve %d accuracy\n\n',N,tol);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: plots the function f(x) and guess window range (if flag==1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Function(xVec,x1,x2,flag)

% initialize storage vector y
yVec = zeros( size( xVec ) );

% vertical line
yVert = 0:0.01:0.5;
x1_Vec = x1*ones( size(yVert) );
x2_Vec = x2*ones( size(yVert) );

% Store values of f(x) at each x_i
for i=1:length(xVec)
    yVec(i) = f( xVec(i) );
end

% plotting attributes
ms = 20;
lw = 6;
fs = 18;

% Plots the function, f(x) 
plot(xVec,yVec,'b.-','LineWidth',lw,'MarkerSize',ms); hold on;
if flag == 1
    plot(x1_Vec,yVert,'r-','LineWidth',lw,'MarkerSize',ms); hold on;
    plot(x2_Vec,yVert,'r-','LineWidth',lw,'MarkerSize',ms); hold on;
end
xlabel('x');
ylabel('y');
set(gca,'FontSize',fs);
axis([0 2 0 0.5]);
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes function f(x) evaluated at input x
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)

val = 0.5 - x*exp( -x^2 );