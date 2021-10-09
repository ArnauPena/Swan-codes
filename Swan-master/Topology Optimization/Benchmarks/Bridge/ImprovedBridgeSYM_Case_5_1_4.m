filename='ImprovedBridge_hexahedra';
 ptype = 'MACRO';
method = 'SIMPALL';
materialType = 'ISOTROPIC';
initial_case = 'holes';
cost = {'compliance'};
weights = [1];
constraint = {'volume'};
optimizer = 'HAMILTON-JACOBI'; incrementFactor = 1;
filterType = 'P1';
line_search_initiator = 'STANDARD';
showBC = true;

HJiter0 = 1;
e2 = 50;
N_holes = [7 3 3];
R_holes = 0.2;
phase_holes = [0 0 0];
nsteps = 10;
Vfrac_final = 0.15;
Perimeter_target = 1;
optimality_final = 1e-3;
constr_final =1e-3;

Vfrac_initial = 0.7;
optimality_initial = 5e-2;
constr_initial = 5e-2;
TOL.rho_plus = 1;
TOL.rho_minus = 0;
TOL.E_plus = 1;
TOL.E_minus = 1e-3;
TOL.nu_plus = 1/3;
TOL.nu_minus = 1/3;

printing = true;