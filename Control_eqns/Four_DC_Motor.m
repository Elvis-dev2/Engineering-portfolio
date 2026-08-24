%% CONTROL SYSTEM 05 - DC MOTOR
% Mechanical model of a DC motor

clear;
clc;
close all;

%% Motor parameters
J = 0.01;       % Rotor inertia
b = 0.1;        % Viscous friction coefficient
K = 1;          % Motor torque constant
i = 1;          % Motor current (A)

%% Simulation time
tspan = [0 5];

%% Initial conditions
% x(1) = angular position
% x(2) = angular velocity

x0 = [0; 0];

%% DC Motor differential equation
motor_system = @(t,x) [
    x(2);
    (K*i - b*x(2))/J
];

%% Solve using ODE45
[t,x] = ode45(motor_system,tspan,x0);

%% Extract results
theta = x(:,1);
omega = x(:,2);

%% Plot angular position
figure;

plot(t,theta,'LineWidth',2);

grid on;

xlabel('Time (s)');
ylabel('Angular Position \theta (rad)');
title('DC Motor - Angular Position');

%% Plot angular velocity
figure;

plot(t,omega,'LineWidth',2);

grid on;

xlabel('Time (s)');
ylabel('Angular Velocity \omega (rad/s)');
title('DC Motor - Angular Velocity');

%% Display final values
fprintf('Final Angular Position: %.2f rad\n', theta(end));
fprintf('Final Angular Velocity: %.2f rad/s\n', omega(end));