%% CONTROL SYSTEM 11 - STATE-SPACE MODEL

clear;
clc;
close all;

%% State-space matrices

A = [0 1;
    -2 -3];

B = [0;
     1];

C = [1 0];

D = 0;

%% Create state-space system

sys = ss(A,B,C,D);

%% Display system

disp('State-Space Model:');
sys

disp('A matrix:');
disp(A);

disp('B matrix:');
disp(B);

disp('C matrix:');
disp(C);

disp('D matrix:');
disp(D);

%% Step response

figure;

step(sys);

grid on;

title('State-Space Model Step Response');

xlabel('Time (s)');
ylabel('Output y(t)');

%% State response

figure;

initial_state = [1; 0];

initial(sys,initial_state);

grid on;

title('State Response from Initial Condition');

xlabel('Time (s)');
ylabel('State');

%% Poles

disp('System poles:');
pole(sys);