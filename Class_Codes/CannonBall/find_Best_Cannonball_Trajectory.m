%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: Find BEST APPROXIMATION solution to "CannonBall" 
%           Problem (aka Boundary Value Problem)
%
% Author: Nick Battista
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,ySol] = find_Best_Cannonball_Trajectory(guess1,guess2)

% Try Guesses, Compute Approx. Soln's, Return Last Value
yGuess1 = approx_Cannonball_Trajectory(guess1);
yGuess2 = approx_Cannonball_Trajectory(guess2);
 
% Determine Higher and Lower Guesses
if yGuess1 > yGuess2
   guessHigh = guess1;
   guessLow = guess2;
else
   guessHigh = guess2;
   guessLow = guess1;   
end

% Initialize Initial Error, Error Tolerance, and Counter
err = abs(yGuess1-yGuess2);
errTol = 1e-15;
ct = 0;
fprintf('\nInitial Error: %d\n',err);
fprintf('Heading into loop GO GO GO!\n\n');

% Take Average for Next Guess at Speed
guess = 0.5*( guessHigh + guessLow ); 

%
% Perform a ROOT-FINDING scheme (e.g., Bisection Method) 
% to find best solution
%
while err > errTol
        
    % Update Counter
    ct = ct+1;
    
    % Compute approximate trajectory due to particular guess
    [lastSolVal,~,~] = approx_Cannonball_Trajectory(guess);
    
    % Update guess window region
    if lastSolVal < 0
        guessLow = guess;
    else
        guessHigh = guess;
    end
    
    % Take Average for Next Guess at Speed
    guess = 0.5*( guessHigh + guessLow );     
    
    % Compute error
    err = abs(guessHigh-guessLow); % right boundary condition is zero
    
    fprintf('Iteration Number: %d\n',ct);
    fprintf('Error = %d\n',err);
    fprintf('Next Guess = %d\n\n',guess);
    
end

fprintf('\n\n\n -->> SUMMARY <<---\n');
fprintf('It took %d guesses to achieve %d accuracy\n',ct,errTol);
fprintf('Best guess at initial speed: %d\n\n\n\n',guess);

%
% Give me BEST APPROXIMATE solution (*using best speed guess from above*)
%
[~,ySol,x] = approx_Cannonball_Trajectory(guess);


%
% Give me TRUE solution (*only known bc problem concocted for this case!*)
%
TrueSol = please_Give_True_Solution(x);

%
% Plotting attributes
%
lw = 7;  % LineWidth for plot command
fs = 18; % FontSize for plot command

%
% Plot TRUE solution vs. BEST APPROXIMATE solution
figure(1)
plot(x,TrueSol,'b-','LineWidth',lw+4); hold on;
plot(x,ySol,'r-','LineWidth',lw); hold on;
xlabel('x');
ylabel('y');
leg=legend('True Soln','Approx. Soln');
set(leg,'FontSize',fs); % Changes font of legend
set(gca,'FontSize',fs);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes approximate trajectory for particular 
%           guess at initial speed
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [lastSolVal,ySol,x] = approx_Cannonball_Trajectory(speed)


xL = 0;        % Left boundary (starting point)
xR = 1;        % Right boundary (ending point)

left_BC = 0;   % left side boundary condition
right_BC = 0;  % right side boundary condition

% 
% Spatial-Step (how far to jump ahead in space each iteration)
%
dx = 0.0001; % Have students try 0.00001, 0.000001 as well (slower but more accuracy - worth it though?)

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
% Give last solution value to RETURN for approximation function
%
lastSolVal = ySol(end);


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

% Initialize Storage for TRUE solution 
TrueSol = zeros( size(x) );

for i=1:length(x)
    TrueSol(i) = 2*( 1-x(i) )*sin( x(i) )*( cos( x(i) ) )^2;
end


