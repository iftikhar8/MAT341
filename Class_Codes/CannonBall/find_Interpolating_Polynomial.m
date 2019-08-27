%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: samples approximate solution to find interpolating polynomial!
%
% Author: Nick Battista
%
% Date: 08/20/19
%
% Institution: The College of New Jersey (TCNJ)
%
% Solves:  Finds interpolation polynomial for to best solution in
%          find_Best_Cannonbal_Trajectory.m, e.g.,
%
%          y'' = ODE_RHS(x)
%
%          y(0) = 0 (left boundary condition)  
%          y(1) = 0 (right boundary condition)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function find_Interpolating_Polynomial(N)

%
% Select number of points to interpolate
%
%N = 7; % note: includes endpoints

%
% Give x-Points and approximate solution values ySol
%
fprintf('\n----------------------------------------------\n');
fprintf('\nFind Best Approximate Solution...\n');
fprintf('\n----------------------------------------------\n\n\n\n');

pause();
guess1 = 1;
guess2 = 5;
[x,ySol] = find_Best_Cannonball_Trajectory(guess1,guess2);
pause();


fprintf('\n----------------------------------------------\n');
fprintf('\nSample the solution at %d points...\n',N);
fprintf('\n----------------------------------------------\n\n\n\n');
pause();

%
% Gives sampling points, xPts
%
xPts = linspace(x(1),x(end),N);

%
% Finds indices for such sampling points
% 
inds = please_Find_Indices(x,xPts);

%
% Store desired Solution values at sampled points 
%
yPts = ySol(inds);

%
% Plot Sampled Points to Check
%
ms = 60; % MarkerSize for plotting
lw = 4;  % LineWidth for plotting
%
plot(xPts,yPts,'g.','MarkerSize',ms,'LineWidth',lw); hold on;
legend('Sampled Points');
pause();


%
% Find interpolation polynomial coefficients
%
fprintf('\n----------------------------------------------\n');
fprintf('\nFind %d-th degree UNIQUE polynomial that goes through those points...\n',N);
coeffs = find_Interpolation_Poly_Coefficients(N,xPts,yPts);
coeffs
fprintf('\n----------------------------------------------\n\n\n\n');
pause();

%
% Plots Interpolation Polynomial
%
ms = 10;                                 % MarkerSize for plotting
xPts = linspace(x(1),x(end),100);        % Domain to plot polynomial at
%
for i=1:length(xPts)
   interpPoly(i) = Poly(xPts(i),coeffs); % Stores value of polynomial for each xPts(i) entry
end
%
fprintf('\n----------------------------------------------\n');
fprintf('\nPlot UNIQUE polynomial...\n');
fprintf('\n----------------------------------------------\n\n\n\n');
pause();
plot(xPts,interpPoly,'m.-','MarkerSize',ms,'LineWidth',lw); hold on;
legend('Interpolation Polynomial');

%
% Store EXACT Taylor Series Coefficients 
% NOTE: this is ONLY for the solution: y(x) = 2(1-x)*sin(x)*cos(x)^2
% NOTE: this is ONLY the first 15 coefficients
TS_Coeffs = [0 2 -2 -7/3 7/3 61/60 -61/60 -527/2520 527/2520 703/25920 -703/25920 -44287/19958400 44287/19958400 398581/3113510400 -398581/3113510400];

%
% Compare Interpolation Poly Coefficients to Taylor Series Coefficients
%
fprintf('\n**********************************************************\n');
fprintf('\nCompare Interp. Poly. Coeffs. to EXACT Taylor Series!...\n');
fprintf('\n**********************************************************\n\n');

pause();
fprintf('nth Coeff  | Interp. Poly. Coeff. | Taylor Series Coeff.  |   Error\n');
fprintf('---------------------------------------------------------------------\n');

for i=1:N
    if i-1<10
        if coeffs(i)<0
            if TS_Coeffs(i)<0
                fprintf('   %d       |        %4.2f         |        %4.2f          |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );
            else
                fprintf('   %d       |        %4.2f         |        %4.2f           |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );
            end
        else
            if TS_Coeffs(i)<0
                fprintf('   %d       |        %4.2f          |        %4.2f          |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );
            else
                fprintf('   %d       |        %4.2f          |        %4.2f           |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );
            end
        end
    
    else
        if coeffs(i)<0
            if TS_Coeffs(i)<0
                fprintf('   %d      |        %4.2f         |        %4.2f          |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );
            else
                fprintf('   %d      |        %4.2f         |        %4.2f           |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );
            end
        else
            if TS_Coeffs(i)<0
                fprintf('   %d      |        %4.2f          |        %4.2f          |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );     
            else
                fprintf('   %d      |        %4.2f          |        %4.2f           |   %4.2f\n',i-1,coeffs(i),TS_Coeffs(i),abs(coeffs(i)-TS_Coeffs(i)) );                     
            end
        end
    end
end
fprintf('\n\n Thats all folks!\n\n\n');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: uses standard interpolation to find polynomial coefficients
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coeffs = find_Interpolation_Poly_Coefficients(N,xPts,yPts)

%
% Construct Vandermonde Matrix
%
A = zeros(N,N);
A(1,:) = 1;
for i=2:N
    A(i,:) = xPts.^(i-1);
end


%
% Give coefficients of interpolation polynomial
% Note: need to take transpose of Vandermonde Matrix
%
coeffs = inv(A')*yPts';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: finds indices corresponding to desired sampling points
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = Poly(x,coeffs)

val = 0;
for i=1:length(coeffs)
   val = val + coeffs(i)*x^(i-1); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: finds indices corresponding to desired sampling points
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function inds = please_Find_Indices(x,xSample)

for i=1:length(xSample)
    
    xPt = xSample(i);
   
    n = 1;
    notFound = 1;
    err = 1;
    errTol = x(2)-x(1);
    while notFound
        
        % make dummy variable to compare to desired sample point
        xTest = x(n);
        
        % test whether our sampled point is same as point in actual x-Grid
        err = abs(xPt-xTest);
        
        if err < errTol
            
            % store index 
            inds(i) = n;
            
            % change flag to stop loop
            notFound = 0;
            
        end
        
        % iterate counter
        n = n+1;
            
    end
    
end


