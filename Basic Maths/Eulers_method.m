clc;
clear;

h = 0.1;
x = 0:h:1;

y = zeros(size(x));
y(1) = 1; 

for n = 1:length(x)-1
    y(n+1) = y(n) + h*(x(n) + y(n));
end

disp [x'y']

plot (x,y,'LineWidth', 2);
grid on;

xlabel('x');
ylabel('y');
title('Euler Method')

%% Comparison

clc;
clear;

h = 0.01;
x = 0:h:1;

% Euler solution
y = zeros(size(x));
y(1) = 1; 

for n = 1:length(x)-1
    y(n+1) = y(n) + h*(x(n) + y(n));
end

% Exact Solution

y_exact = 2*exp(x)-x-1;

%Error 
error = abs(y_exact -y);

%Display results
T = table(x',y',y_exact',error',...
    'VariableNames',{'x','Euler','Exact','Error'});


disp (T);


% Plot
plot (x,y,'o-',x,y_exact,'-', 'LineWidth',2);
grid on;
xlabel('x');
ylabel('y');
legend('Euler','Exact')
title('Euler Method vs Exact solution')

