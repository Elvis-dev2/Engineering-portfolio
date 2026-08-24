clc;
clear;

x = 0.5;

for i = 1:10
    f =cos(x) - x;
    df = -sin(x) - 1;

    x_new = x - f/df;

    fprintf('Iteration %d:x = %.10f\n',i,x_new);

    x = x_new;
end
 