clc;
clear;
close all;

%% Geometry
L = 200; % Length [mm]
H = 50;  % Height [mm]
R = 20;  % Hole radius [mm]

%% Mesh
nx = 40;
ny = 10;

x = linspace(0,L,nx+1);
y = linspace(0,H,ny+1);

[X,Y] = meshgrid(x,y);

nodes = [X(:), Y(:)];

%% Create triangular elements
elements = [];

for j = 1:ny
    for i = 1:nx

       n1 = (j-1)*(nx+1)+i;
       n2 = n1 + 1;
       n3 = j*(nx+1)+i;
       n4 = n3 + 1;

       elements = [elements; 
           n1 n2 n4; 
           n1 n4 n3];
    end
end

%% Plot mesh
figure;

triplot(elements,nodes(:,1),nodes(:,2));

axis equal;
xlabel('X [mm]');
ylabel('Y [mm]');
title('2D Plate Finite Element Mesh');
grid on;
