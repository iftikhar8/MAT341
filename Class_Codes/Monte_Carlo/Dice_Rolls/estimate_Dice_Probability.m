
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: estimates probability of rolling a 5 on a fair dice
%
%           returns: error
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function error = estimate_Dice_Probability(N)

% input: 1. N: number of times to roll dice for probability approximation

% initialize # of times 5 has been rolled to zero.
count5 = 0; 

for i=1:N
    
   %diceRoll = perform_Dice_Roll();
   
   diceRoll = rand(1);     % rand(1) returns value between 0 and 1
   
   if diceRoll <= 1/6      % defined to be a roll of 1
       val = 1;
   elseif diceRoll <= 2/6  % defined to be a roll of 2
       val = 2;
   elseif diceRoll <= 3/6  % defined to be a roll of 3
       val = 3;
   elseif diceRoll <= 4/6  % defined to be a roll of 4
       val = 4;
   elseif diceRoll <= 5/6  % defined to be a roll of 5
       val = 5;
   else                    % defined to be a roll of 6
       val = 6;
   end
    
   % if roll is a 5, increment the # of 5's rolled
   if val == 5 
       count5 = count5 + 1;
   end
   
end

% compute estimated probability (# of 5's rolled / total # of rolls)
est_probability = count5 / N;

% compute error
error = abs(est_probability - 1/6);