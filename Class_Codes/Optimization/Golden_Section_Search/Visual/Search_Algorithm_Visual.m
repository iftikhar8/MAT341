%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: uses the GOLDEN SECTION-LIKE SEARCH to find an approximate minimum
%           of a function, f(x). This is meant for a visualization to help
%           students build their algorithm
%
% INPUT: 
%
% RETURNS: N (number of iterations)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Search_Algorithm_Visual()

% Search step, tau
tau = 0.35;

a = 0;  % lower bound of interval
b = 2;  % upper bound of interval

aOrig = a; % for plotting
bOrig = b; % for plotting

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
flag = 0;
plot_Function(a:(b-a)/1e3:b,x1,x2,a,b,flag);
pause();
flag = 1;
plot_Function(a:(b-a)/1e3:b,x1,x2,a,b,flag);
pause();
clf;

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
    
    plot_Function(aOrig:(bOrig-aOrig)/1e3:bOrig,x1,x2,a,b,flag);
    pause();
    clf;
    
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
% FUNCTION: plots the function f(x) and guess window range (if flag==1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Function(xVec,x1,x2,a,b,flag)

% initialize storage vector y
yVec = zeros( size( xVec ) );

% vertical line
yVert = 0:0.025:0.5;
x1_Vec = x1*ones( size(yVert) );
x2_Vec = x2*ones( size(yVert) );
a_Vec = a*ones( size(yVert) );
b_Vec = b*ones( size(yVert) );

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
    plot(x1_Vec,yVert,'g:','LineWidth',lw,'MarkerSize',ms); hold on;
    plot(x2_Vec,yVert,'g:','LineWidth',lw,'MarkerSize',ms); hold on;
    plot(a_Vec,yVert,'r-','LineWidth',lw,'MarkerSize',ms); hold on;
    plot(b_Vec,yVert,'r-','LineWidth',lw,'MarkerSize',ms); hold on;
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