%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ******************* WORKING VERSION *************************
%
% FUNCTION: script2: practice debugging
%
% NOTE: 1) in this script, we want to define an array (vector)
%          of x-Values (independent variable)
%
%       2) next we want to evaluate a function y=f(x) at every x-Value
%          and then plot. 
%   
%       3) script will throw errors; fix them.
%
% ******************* WORKING VERSION *************************
%
% PERFORMS: evaluated a function, f(x), at x values defined in 
%           an array, x, and then plots the two vectors against 
%           each other
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function script2()

% Define vector of x values (independent variable)
x = 1.25:0.025:2.5;

% Loop over every value within the x-Vector to evaluate each component 
%   in the function, f(x), and store its associated value in a vector
for i=1:length(x)
   
    % ERROR: 
    %   1) need to give input as a component of vector x, e.g., x(i)
    %   2) need to store associated y-value in a vector, e.g., y(i)
    %   3) output is never defined in function f(x) below.
    %   FIX: y = f(x) --> y(i) = f( x(i) );
    y(i) = f( x(i) );
    
end

% plotting attributes
ms = 10;  % MarkerSize value
lw = 5;   % LineWidth value

% plot the vector y against x
plot(x,y,'k.-','MarkerSize',ms,'LineWidth',lw);
xlabel('x');
ylabel('y');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: computes function y=f(x) for given input x
%
% RETURNS: function value when evaluated at input, x.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ERROR: the output is never declared in the function defintion
% FIX: function f(x) --> function val = f(x)

function val = f(x)

val = 5*sin(x^2)*cos(x);



