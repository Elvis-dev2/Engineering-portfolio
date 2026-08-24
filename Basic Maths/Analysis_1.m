clc;
clear;

%% Material and geometry
 E = 2000e9; % Young's modulus [Pa]
 A = 100e-9; % Area [m squared]
 L = 1;

 %% FEA mesh
 nElements =4;
 nNodes = nElements + 1;
 Le = L/nElements;

 %% Global stiffness matrix
 K = zeros(nNodes);

 %% Assemble elements stiffness matrices
 ke = (A*E/Le)*[1 -1;-1 1];

 for e = 1:nElements
     nodes = [e e+1];
     K(nodes, nodes) = K(nodes, nodes) + ke;
 end

 %% Force vector
  F = zeros(nNodes, 1);
  F(end) = 10000; % 10kN

  %% Boundary conditions
  % Node 1 is fixed
  fixed =1;
  free = 2:nNodes;

  %% Solve
  U = zeros(nNodes,1);
  U(free) = K(free,free)\F(free);

  %% Display displacement
  disp('Nodal displacement [m]:')
  disp(U)

  %% Calculate element stresses
  stress = zeros(nElements, 1);

  for e = 1:nElements
      nodes = [e e+1];
      ue = U(nodes);

      stress(e) = E/Le * [-1 1]*ue;
  end

  disp('Elements stresses[Pa]:')
  disp (stress)

  %% Plot deformation
  x = linspace(0,L,nNodes);

  figure
  plot(x,U*1000,'o-','LineWidth',2);
  xlabel('Position [m]');
  ylabel('Displacement [mm]');
  title('FEA: Axial Bar Deformation')
  grid on;
