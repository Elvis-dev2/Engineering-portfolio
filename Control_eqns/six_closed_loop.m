%% CONTROL SYSTEM 07 - CLOSED-LOOP CONTROL

clear;
clc;
close all;

%% Define plant
G = tf(1,[1 1]);

%% Define feedback
H = 1;

%% Closed-loop transfer function
T = feedback(G,H);

%% Display systems
disp('Open-loop plant G(s):');
G

disp('Closed-loop transfer function T(s):');
T

%% Step response comparison
figure;

step(G);
hold on;
step(T);

grid on;

legend('Open Loop','Closed Loop');

title('Open-Loop vs Closed-Loop Response');
xlabel('Time (s)');
ylabel('Output');

%% Display closed-loop poles
disp('Closed-loop poles:');
pole(T);