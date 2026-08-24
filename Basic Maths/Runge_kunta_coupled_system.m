clc;
clear;
close all;

%% Step size
h = 0.01;

%% Time
t = 0:h:10;
N = length(t);

%% Storage
x = zeros(1,N);
y = zeros(1,N);

%% Initial conditions
x(1) = 1;
y(1) = 0;

%% RK4
for n = 1:N-1

    % k1
    k1x = y(n);
    k1y = -4*x(n) - 0.5*y(n);

    % k2
    k2x = y(n) + h*k1y/2;
    k2y = -4*(x(n)+h*k1x/2) ...
          -0.5*(y(n)+h*k1y/2);

    % k3
    k3x = y(n) + h*k2y/2;
    k3y = -4*(x(n)+h*k2x/2) ...
          -0.5*(y(n)+h*k2y/2);

    % k4
    k4x = y(n) + h*k3y;
    k4y = -4*(x(n)+h*k3x) ...
          -0.5*(y(n)+h*k3y);

    % Update
    x(n+1) = x(n) + ...
        h*(k1x + 2*k2x + 2*k3x + k4x)/6;

    y(n+1) = y(n) + ...
        h*(k1y + 2*k2y + 2*k3y + k4y)/6;
end

%% Plot displacement
plot(t,x,'LineWidth',2);
grid on;

xlabel('Time [s]');
ylabel('Displacement x');
title('RK4 Solution of Damped Oscillator');
