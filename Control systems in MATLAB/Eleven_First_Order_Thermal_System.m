%% CONTROL SYSTEM 04 - FIRST-ORDER THERMAL SYSTEM
% Biomedical Engineering Control Systems
% Model: Simple heating system

clear;
clc;
close all;

%% System parameters
C = 10;          % Thermal capacitance
h = 2;           % Heat-loss coefficient
P = 100;         % Heater power
Ta = 25;         % Ambient temperature (deg C)

%% Simulation time
tspan = [0 100];

%% Differential equation
% C*dT/dt = P - h*(T - Ta)

thermal_system = @(t,T) (P - h*(T - Ta))/C;

%% Initial temperature
T0 = 25;

%% Solve the system
[t,T] = ode45(thermal_system,tspan,T0);

%% Plot temperature response
figure;

plot(t,T,'LineWidth',2);

grid on;

xlabel('Time (s)');
ylabel('Temperature (^oC)');
title('First-Order Thermal System');

%% Display final temperature
fprintf('Final Temperature: %.2f °C\n', T(end));
fprintf('Ambient Temperature: %.2f °C\n', Ta);
fprintf('Temperature Rise: %.2f °C\n', T(end)-Ta);