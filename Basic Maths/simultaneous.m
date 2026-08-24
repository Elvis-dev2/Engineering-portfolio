clc;
clear;

%% Solving 2x2 matrix
A = [2 3;
    4 -1];

b = [13
    5];

x = A\b

%% Solving 4x4 matrix

A = [2 1 1 1;
    1 3 1 1;
    1 1 4 1;
    1 1 1 5];

b = [10;
    12;
    15;
    17];
x = A\b

%% Simple spring system

K = [200 -100 0;
    -100 250 -150;
    0 -150 150];

F = [0;
    100;
    200];

x = K\F

%% Exercise 

fun = @(z)[
    z(1)^2 + z(2)^2 - 25;
    exp(z(1)) + z(2) - 5
    ];

z0 = [1; 2];
 solutions = fsolve(fun,z0);

 x = solutions(1)
 y = solutions(2)