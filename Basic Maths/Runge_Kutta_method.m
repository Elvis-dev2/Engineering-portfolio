clc;
clear;
close all;

f = @(X,Y) X + Y;

h = 0.1;
x = 0:h:1;

y = zeros(size(x));
y(1) = 1;

for n = 1:length(x) - 1
    k1 = f(x(n),y(n));

    k2 = f(x(n)+ h/2,...
        y(n)+h*k1/2);

    k3 = f(x(n)+h/2,...
        y(n)+h*k2/2);

    k4 = f(x(n)+h,...
        y(n)+h*k3);

    y(n+1) = y(n) + ...
        h*(k1 + 2*k2 + 2*k3 + k4)/6;
end

%Exact solution
y_exact = 2*exp(x)-x-1;

%Error

error = abs(y_exact -y);

fprintf('RK4 result at x=1: %. 10f\n',y(end));
fprintf('Exact result:  %.10f\n',y_exact(end));
fprintf('Error:   %.10f\n',error(end));

plot (x,y,'o-',x,y_exact,'-', 'LineWidth',2);
grid on;
xlabel('x');
ylabel('y');
legend('Euler','Exact')
title('Euler Method vs Exact solution')

%% Runge_Kunta for coupled system

clc;
clear;
close all;

f = @(t,z) [
    z(2);
    -4*z(1)-0.5*z(2)
];

tspan = [0 10];
z0 = [1; 0];

[t,z] = ode45(f,tspan,z0);

x = z(:,1);
y = z(:,2);

plot(t,x,'LineWidth',2);
grid on;

xlabel('Time [s]');
ylabel('Displacement x');
title('Damped Oscillator');

