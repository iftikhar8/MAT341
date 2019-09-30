%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: tries to find solutions to Brocard's Problem (n!+1=m^2)
%           and then tries to find solutions to variations of Brocard's
%           Problem, e.g.,
%
%           n! + n^k = m^j   where (n,m) are positive integers, k is a
%           positive integer or zero, and is a positive integer greater
%           than or equal to 2.
%
% AUTHOR: Nick Battista
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% INTERESTING CASES: m^pow1 + n^pow2 - factorial(n) == 0
%                   1. (pow1,pow2)=(4,2) & (n,m)=(3,2)
%                   2. (pow1,pow2)=(3,3) & (n,m)=(1,1)
%
% INTERESTING CASES: m^pow1 - n^pow2 - factorial(n) == 0
%                   1. (pow1=2,pow2=0), (n,m)=(4,5)
%                   2. (pow1=2,pow2=0), (n,m)=(5,11)
%                   3. (pow1=2,pow2=0), (n,m)=(7,71)
%                   4. (pow1=2,pow2=1), (n,m)=(2,2)
%                   4. (pow1=2,pow2=1), (n,m)=(3,3)
%                   6. (pow1=2,pow2=3), (n,m)=(9,603)
%                   7. (pow1=3,pow2=1), (n,m)=(5,5)
%
% INTERESTING CASES: m^pow1 - 2*n^pow2 - factorial(n) == 0
%                   1. (pow1=2,pow2=0), (n,m)=(2,2)
%                   2. (pow1=3,pow2=0), (n,m)=(3,2)
%                   3. (pow1=5,pow2=1), (n,m)=(4,2)
%
%
% INTERESTING CASES: m^pow1 - n^pow2 - factorial(n) == 0
%                   1. (pow1=2,pow2=0), (n,m)=(3,3)
%                   2. (pow1=2,pow2=1), (n,m)=(4,6)
%                   3. (pow1=3,pow2=0), (n,m)=(4,3)
%                   4. (pow1=3,pow2=1), (n,m)=(2,2)
%                   5. (pow1=3,pow2=3), (n,m)=(4,6)
%
% INTERESTING CASES: m^pow1 + m - n^pow2 - factorial(n) == 0
%                   1. (pow1=2,pow2=2), (n,m)=(6,27)
%                   2. (pow1=3,pow2=7), (n,m)=(2,5)
%
% INTERESTING CASES: m^pow1 + m^(pow1-2) - n^pow2 - factorial(n) == 0
%                   1. (pow1=2,pow2=2), (n,m)=(5,12)
%                   2. (pow1=2,pow2=3), (n,m)=(2,3)
%                   3. (pow1=3,pow2=3), (n,m)=(2,2)
%                   4. (pow1=3,pow2=7), (n,m)=(2,5)
%                   5. (pow1=5,pow2=2), (n,m)=(4,2)
%
%
% eqn1: m^2 - 1 - factorial(n) == 0    (Brocard's Problem)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Brocards_Problem()

nVec = 1:1:15;
ct = 0;

for pow1 = 2:10

    for pow2 = 0:10

    fprintf('\n\n---> trying POW1=%d & POW2=%d <---\n',pow1,pow2);

        for i=1:length(nVec)

            n = nVec(i);
            m = 0;
            
            %poly_n = get_Poly(n,pow2);
            
            while m <= ( factorial(n) + n^pow2 )^(1/max(2,pow1))
            %while m <= ( factorial(n) + poly_n )^(1/max(2,pow1))
                
                m = m+1;

                if ( m^pow1 - n^pow2 - factorial(n) == 0 )
                %if ( m^pow1 - poly_n - factorial(n) == 0 )

                    ct = ct+1;
                    MAT(ct,1) = pow1;
                    MAT(ct,2) = pow2;
                    MAT(ct,3) = n;
                    MAT(ct,4) = m;

                    fprintf('Soln for: (pow1=%d,pow2=%d), (n,m)=(%d,%d)\n',pow1,pow2,n,m);

                end  

            end

        end

    end
    
end

MAT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: returns polynomial: 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function poly_n = get_Poly(n,pow2)

% initialize poly value to 0
poly_n = 0;

for j=0:1:pow2
    poly_n = poly_n + (-1)^(j+2) * n^j;
end

