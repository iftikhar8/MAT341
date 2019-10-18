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

function N = Successive_Parabolic_Interp_Visual()

a = 0;  % lower bound of interval
b = 2;  % upper bound of interval


x3 = 0.0;   % define first point ("oldest point")
x2 = 0.3;   % define second point ("second oldest point")
x1 = 1.4;   % define third point ("newest point")

err = 1;     % initialize error to get into while loop
tol = 1e-8; % initialize error tolerance

% initialize function values
f3 = f(x3);
f2 = f(x2);
f1 = f(x1);

% iteration counter
N = 0;

% TEST PLOT THE FUNCTION
flag = 0;
plot_Function(a:(b-a)/1e3:b,x1,x2,x3,a,b,flag);
pause();
flag = 1;
plot_Function(a:(b-a)/1e3:b,x1,x2,x3,a,b,flag);
pause();
clf;

while err > tol
   
    % increment counter
    N = N+1;
    
    % Fill Matrix
    A(1,:) = [x1^2 x1 1]; % fill first row of matrix
    A(2,:) = [x2^2 x2 1]; % fill second row of matrix
    A(3,:) = [x3^2 x3 1]; % fill third row of matrix
    
    % Vector of Function Values 
    bVec(1) = f(x1);
    bVec(2) = f(x2);
    bVec(3) = f(x3);
    
    % Compute coefficients of parabola (invert linear system)
    quadCoeffs = inv(A) * bVec';
    
    % Store coefficients of Parabola
    aCoeff = quadCoeffs(1); % coefficient on 'ax^2' term of parabola
    bCoeff = quadCoeffs(2); % coefficient on 'bx' term of parabola
    cCoeff = quadCoeffs(3); % not needed -> constant 'c' term of parabola
    
    % Redefine points
    x3 = x2;       % Previous 2nd point is now oldest
    x2 = x1;       % Previous newest point is now second oldest
    x1 = -bCoeff/(2*aCoeff); % Root of parabola is newest point
    
    % Compute Error
    err = abs(x3-x1);
    
    % Visualize convergence on function plot
    plot_Function(a:(b-a)/1e3:b,x1,x2,x3,a,b,flag);
    pause();
    clf;
    
end

fprintf('\n\nIt took %d iterations to achieve %d accuracy\n\n',N,tol);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: plots the function f(x) and guess window range (if flag==1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Function(xVec,x1,x2,x3,a,b,flag)

% initialize storage vector y
yVec = zeros( size( xVec ) );
parabolaVec = yVec;

% Fill Matrix to find Parabola Coeffs
A(1,:) = [x1^2 x1 1]; % fill first row of matrix
A(2,:) = [x2^2 x2 1]; % fill second row of matrix
A(3,:) = [x3^2 x3 1]; % fill third row of matrix

% Vector of Function Values 
bVec(1) = f(x1);
bVec(2) = f(x2);
bVec(3) = f(x3);

% Compute coefficients of parabola (invert linear system)
quadCoeffs = inv(A) * bVec';

% Store PARABOLA and FUNCTION values at each x_i
for i=1:length(xVec)
    
    % function values
    yVec(i) = f( xVec(i) );
    
    % parabola values
    parabolaVec(i) = quadCoeffs(1)*xVec(i)^2 + quadCoeffs(2)*xVec(i) + quadCoeffs(3);
    
end

% find Minimum of Parabola to Plot vertical line
pMin = -quadCoeffs(2) / (2*quadCoeffs(1)); % "xMin = -b/(2a)"

% vertical line values
yVert = -0.05:0.025:0.55;
xVert = pMin*ones( size(yVert) );


% plotting attributes
ms = 20;
lw = 6;
fs = 18;

% Plots the function, f(x) 
plot(xVec,yVec,'b.-','LineWidth',lw,'MarkerSize',ms); hold on;
if flag == 1
    
    % plot three points
    plot(x1,f(x1),'r.','MarkerSize',ms+10); hold on;
    plot(x2,f(x2),'r.','MarkerSize',ms+10); hold on;
    plot(x3,f(x3),'r.','MarkerSize',ms+10); hold on;
    axis([-0.1 2.1 -0.05 0.55]);

    pause();
    
    % plot parabola going through points
    plot(xVec,parabolaVec,'k:','LineWidth',lw-1,'MarkerSize',ms-5); hold on;
    axis([-0.1 2.1 -0.05 0.55]);

    pause();
    
    % plot next point for algorithm
    plot(xVert,yVert,'r:','LineWidth',lw-1,'MarkerSize',ms-5); hold on;

end
xlabel('x');
ylabel('y');
set(gca,'FontSize',fs);
axis([-0.1 2.1 -0.05 0.55]);
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes function f(x) evaluated at input x
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)

val = 0.5 - x*exp( -x^2 );