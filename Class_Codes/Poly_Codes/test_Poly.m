%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: tests our 3 2nd degree polynomial codes
%
% Author: Nick A. Battista
%
% Date: 9/4/19
%
% Institution: The College of New Jersey (TCNJ)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function test_Poly()

% independent variable x value
x = 3;

% polynomial coefficients
a = [1 1.5 2.5];

% TEST POLYNOMIAL p1(x): make sure coefficients match inside p1.m script
p1(x)

% TEST POLYNOMIAL p2(a0,a1,a2,x)
p2(a(1),a(2),a(3),x)

% TEST POLYNOMIAL p3(a,x)
p3(a,x)

% TEST GENERAL POLYNOMIAL CODE: general_Poly(a,x)
general_Poly(a,x)

%
% NOTE: there is no input into the function test_Poly() nor are we passing
% back ("returning") anything when we call this script. This script will
% run and do everything within it, but not return (pass back) anything to
% the command window.
%