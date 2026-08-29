%% CONTROL SYSTEM 06 - TRANSFER FUNCTION

clear;
clc;
close all;

%% Define transfer function
num = [1];
den = [1 2];

G = tf(num, den);

%% Display transfer function
disp('Transfer Function:');
G

%% Step response
figure;

step(G);

grid on;

title('Step Response of G(s) = 1/(s + 2)');
xlabel('Time (s)');
ylabel('Output y(t)');

%% Step response data
[y,t] = step(G);

%% Display final value
fprintf('Final value: %.4f\n', y(end));