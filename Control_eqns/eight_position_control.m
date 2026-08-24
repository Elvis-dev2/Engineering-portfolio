%% CONTROL SYSTEM 09 - POSITION CONTROL

clear;
clc;
close all;

%% Controller gains
Kp = 4;
Kd = 2;

%% Target position
x_target = 1;

%% Simulation time
tspan = [0 10];

%% Initial conditions
% x(1) = position
% x(2) = velocity
x0 = [0; 0];

%% Position-control differential equation
position_system = @(t,x) [
    x(2);
    Kp*(x_target - x(1)) - Kd*x(2)
];

%% Solve using ODE45
[t,x] = ode45(position_system,tspan,x0);

%% Extract position and velocity
position = x(:,1);
velocity = x(:,2);

%% Plot position response
figure;

plot(t,position,'LineWidth',2);
hold on;

yline(x_target,'--','Target Position');

grid on;

xlabel('Time (s)');
ylabel('Position');
title('Closed-Loop Position Control');

legend('Actual Position','Target Position');

%% Plot velocity
figure;

plot(t,velocity,'LineWidth',2);

grid on;

xlabel('Time (s)');
ylabel('Velocity');
title('Position-Controlled System Velocity');

%% Final values
fprintf('Final Position: %.4f\n', position(end));
fprintf('Final Velocity: %.4f\n', velocity(end));
fprintf('Position Error: %.4f\n', x_target-position(end));