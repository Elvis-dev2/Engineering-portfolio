clear;
clc;
close all;

t = 0:0.01:3;
dt = 0.01;

u = ones(size(t));
x = zeros(size(t));

for k = 1:length(t)-1
    dx = -5*x(k) + 2*u(k);
    x(k+1) = x(k) + dx*dt;
end

plot(t,x,'LineWidth',2);
grid on;

xlabel('Time (s)');
ylabel('x(t)');
title('Exercise 2: First-Order System');