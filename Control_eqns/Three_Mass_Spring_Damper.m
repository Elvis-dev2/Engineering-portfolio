clear;
clc;
close all;

% Parameters
m = 1;
c = 2;
k = 5;

% Simulation
t = 0:0.01:10;
dt = 0.01;

% Input force
F = ones(size(t));

% States
x = zeros(size(t));       % Position
v = zeros(size(t));       % Velocity

% Numerical integration
for n = 1:length(t)-1

    acceleration = (F(n) - c*v(n) - k*x(n))/m;

    v(n+1) = v(n) + acceleration*dt;

    x(n+1) = x(n) + v(n)*dt;

end

% Plot position
plot(t,x,'LineWidth',2);
grid on;

xlabel('Time (s)');
ylabel('Position x (m)');
title('Mass-Spring-Damper Response');