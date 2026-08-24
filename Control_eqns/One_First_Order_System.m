clear;
clc;
close all;

a = 2;

t = 0:0.01:5;

u = ones(size(t));

x = zeros(size(t));

for k = 1:length(t)-1
    dx = -a*x(k) + u(k);
    x(k+1) = x(k) + dx*0.01;
end

plot(t,x,'LineWidth',2);
grid on;

xlabel('Time (s)');
ylabel('x(t)');
title('First-Order System Response');