%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: Find approximate solution to "CannonBall" Problem
%           (aka Boundary Value Problem)
%
% Author: Nick A. Battista
%
% Date: 08/20/19
%
% Institution: The College of New Jersey (TCNJ)
%
% Solves:  y'' = ODE_RHS(x)
%
%          y(0) = 0 (left boundary condition)  
%          y(1) = 0 (right boundary condition)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function approx_Cannonball_Trajectory(speed)

xL = 0;        % Left boundary (starting point)
xR = 1;        % Right boundary (ending point)

left_BC = 0;   % left side boundary condition
right_BC = 0;  % right side boundary condition

dx = 0.001;     % spatial-step (how far to jump ahead in space each iteration)

%
% Initializing Solution Storage, Counters, etc.
%
ct = 1;             % counter variable
x(ct) = xL;         % initial spot of cannonball at left end point
ySol(ct) = left_BC; % first solution trajectory into array (vector)
vSol(ct) = speed;   % first GUESS for trajectory initial speed (input)

%
% Keep jumping forward until cannonball reaches right side!
%
while x(ct) < xR
    
    % Increase counter by 1 
    ct = ct + 1;
    
    % Jump ahead in space using "Euler's Method"
    ySol(ct) = ySol(ct-1) + dx*( vSol(ct-1) );
    vSol(ct) = vSol(ct-1) + dx*( ODE_RHS( x(ct-1) ) );
    
    % Increase x position by amount dx moving to right
    x(ct) = x(ct-1) + dx;
    
end


%
% Give me TRUE solution (*only known bc problem concocted for this case!*)
%
TrueSol = please_Give_True_Solution(x);

%
% Compute error at right-most side at boundary 
% between TRUE solution and APPROX. solution!
%
err = abs(TrueSol(end) - ySol(end)); % NOTE: 'end' is used to give last entry in array (vector)
fprintf('\n\n -->> SUMMARY <<-- \n\n');
fprintf('Used Initial Guess: %d\n',speed);
fprintf('Error at Right-Most Side: %d\n\n\n',err);



% Plotting attributes
lw = 7;  % LineWidth for plot command
fs = 18; % FontSize for plot command
ms = 20; % MarkerSize for plot command
clf;     % Clear any previous plots already there

% Plot TRUE solution
figure(1)
plot(x,TrueSol,'b-','LineWidth',lw); hold on;
set(gca,'FontSize',fs); % Changes font of axis labels

% Plot APPROXIMATE Solution
figure(1)
for i=1:length(x)
   plot(x(i),ySol(i),'r.','MarkerSize',ms); hold on;
   pause(0.001);
end

% Plotting again JUST FOR LEGEND TO SHOW UP
figure(1)
plot(x,TrueSol,'b-','LineWidth',lw); hold on;
plot(x,ySol,'r-','LineWidth',lw); hold on;
xlabel('x');
ylabel('y');
leg=legend('True Soln','Approx. Soln');
set(leg,'FontSize',fs); % Changes font of legend


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: Returns Right Hand Side of the Differential Equation
%
%           y'' = ODE_RHS(x)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = ODE_RHS(x)

val = -4*(x-1)*(sin(x))^3 - 4*(cos(x))^3 + 14*(x-1)*sin(x)*(cos(x))^2 + 8*(sin(x))^2*cos(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: Returns Array of Solution Values on Grid, x
%
% NOTE: this is only known bc problem was concocted to test this.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function TrueSol = please_Give_True_Solution(x)

for i=1:length(x)
    TrueSol(i) = 2*( 1-x(i) )*sin( x(i) )*( cos( x(i) ) )^2;
end
