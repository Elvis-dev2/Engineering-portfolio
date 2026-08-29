%% CONTROL SYSTEM 10 - NONLINEAR CONTROL

clear;
clc;
close all;

%% Input
u = 0.2;

%% Simulation time
tspan = [0 10];

%% Initial condition
x0 = 0;

%% Nonlinear differential equation
nonlinear_system = @(t,x) x - x^3 + u;

%% Solve using ODE45
[t,x] = ode45(nonlinear_system,tspan,x0);

%% Plot state response
figure;

plot(t,x,'LineWidth',2);

grid on;

xlabel('Time (s)');
ylabel('State x');
title('Nonlinear Control System');

%% Plot the nonlinear dynamics
figure;

x_values = linspace(-2,2,500);

dx = x_values - x_values.^3 + u;

plot(x_values,dx,'LineWidth',2);

grid on;

xlabel('State x');
ylabel('dx/dt');
title('Nonlinear State Dynamics');

%% Display final state
fprintf('Final state x = %.4f\n',x(end));