clc;
clear;
close all;

%% Roots

 a = 1;
 b = -4;
 c = 3;

 roots1 = [-b + sqrt((b^2)-4*a*c)]/(2*a)
 roots2 = [-b - sqrt(b^2-4*a*c)]/(2*a)

 %% Plot

 x = [-2:0 1:6];
 y = x.^2 - 4*x + 3;

 plot (x,y,'LineWidth',2);
 grid on;

 xlabel('x');
 ylabel('y');
 title('Quadratic Equation')

%% Quadratic with complex roots

clc;
clear;

a = 1;
b = 4;
c = 13;

D = b^2 - 4*a*c

X1 = (-b + sqrt(D))/(2*a)
X2 = (-b - sqrt(D))/(2*a)

%% Projectile motion

clc;
clear;

a = -4.9;
b = 20;
c = 2;

D = b^2 - 4*a*c;

Time1 = (-b + sqrt(D))/(2*a)
Time2 = (-b - sqrt(D))/(2*a)