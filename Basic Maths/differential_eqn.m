clc;
clear;
close all;

f = @(x,y)6 - 3*y;

[x,y] = ode45(f,[0 5],0);

plot (x,y,'LineWidth', 2);
grid on;

xlabel('x');
ylabel('y');
title('Solution of dy/dx + 3y = 6')

%% Mass spring damper system

clc;
clear;
close all;

m = 2;
c = 4;
k = 20;
F = 10;

ode = @(t,x)[
    x(2);
    (F-c*x(2)-k*x(1))/m
    ];

tspan = [0 10];
x0 = [0; 0];

[t,x] = ode45(ode,tspan,x0);

plot(t,x(:,1),'LineWidth',2);
grid on;

xlabel('Time [s]');
ylabel('Displacement');
title('Mass-Spring-Damper Response');