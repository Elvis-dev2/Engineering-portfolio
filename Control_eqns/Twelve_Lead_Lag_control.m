%% CONTROL SYSTEM 12 - LEAD-LAG CONTROL

clear;
clc;
close all;

%% Controller
C = tf([1 2],[1 5]);

%% Plant
G = tf(1,[1 1]);

%% Open-loop system
L = C*G;

%% Closed-loop system
T = feedback(L,1);

%% Display systems
disp('Lead-Lag Controller:');
C

disp('Plant:');
G

disp('Closed-Loop System:');
T

%% Step response
figure;

step(T);

grid on;

title('Lead-Lag Controlled System');

xlabel('Time (s)');
ylabel('Output');

%% Step response information
info = stepinfo(T);

disp('Step Response Characteristics:');
disp(info);

%% Poles
disp('Closed-loop poles:');
pole(T);