%% CONTROL SYSTEM 08 - PID CONTROL

clear;
clc;
close all;

%% PID gains
Kp = 2;
Ki = 1;
Kd = 0.5;

%% PID controller
C = pid(Kp, Ki, Kd);

%% Plant
G = tf(1, [1 1]);

%% Closed-loop system
T = feedback(C*G, 1);

%% Display systems
disp('PID Controller:');
C

disp('Closed-loop transfer function:');
T

%% Step response
figure;

step(T);

grid on;

title('PID-Controlled System');
xlabel('Time (s)');
ylabel('Output');

%% Step-response information
info = stepinfo(T);

disp('Step Response Characteristics:');
disp(info);
