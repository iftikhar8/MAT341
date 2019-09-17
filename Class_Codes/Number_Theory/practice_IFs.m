%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: purpose is to practice "if-statement" logical 
%           expressions
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function practice_IFs()

% set value of x to 8 for testing if-statements
x = 8;

if x < 5
    A = 10; % sets A to 10 if x is less than 5
else
    A = 57.5; % sets A to 57.5 if x is NOT less than 5
end

% set value of y to 37 for testing if-statements
y = 37;

if y < 5       % false
    B = 2*y-1; % does not execute bc boolean was false

elseif y < 10      % executes bc previous statement was FALSE, this statement is TRUE
    B = 3*y^2 + 2; % B is set to 3*y^2+2
end


% set value of x to 3 for testing if-statements
% 
% here illustrating that the next else-if statement only executes
% if PREVIOUS was FALSE
%
x = 3;

if x < 2       % false
    A = 1;    
elseif x < 5   % true
    A = 2;
elseif x < 10  % doesn't execute bc previous was true
    A = 3; 
elseif x < 100 % doesn't execute bc a previous statement was true
    A = 4;
else           % doesn't execute bc a previous statement was true
    A = 5;
end

% A should have the value 2
A


% set value of x to 3 for testing if-statements
% 
% here illustrating that each if-statement block will execute
% compare to difference when using elseif's above
%
x = 3;

if x < 2   % false
    C = 1; 
end

if x < 5   % true
    C = 2;
end

if x < 10  % true
    C = 3;
end

if x < 100 % true
    C = 4;
end

if x < 1000 % true
    C = 5;
end

% C should have value 1000
C


%
% The next batch of statements are to have proper syntax 
% for testing other boolean expressions 
%
x = 5; 
y = 3;

% less than or equal to
if x <= y
    A = 1;
end

% greater than or equal to
if x >= y
    A = 2;
end

% equal to (TWO equal signs)
if x == y
    A = 3;
end

% NOT equal to
if x ~= y
    A = 4;
end

% AND ( if BOTH statements are TRUE do something)
%     ( note: here is a convoluded way to ask if x is STRICTLY less than y)
if ( ( x<=y ) && ( x~=y )  )
    A = 5;
end

 
% OR (if EITHER statement (or both) is TRUE do something)
%     ( note: here is a convoluded way to ask if x ~= y)
if ( (x>y) || (x<y) )
    A = 6;
end

    
    
    
    























