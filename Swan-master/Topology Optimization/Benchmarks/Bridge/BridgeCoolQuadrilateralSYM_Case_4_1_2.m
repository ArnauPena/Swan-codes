filename='BridgeCool_Quadrilateral_Bilinear_Structured';
 ptype = 'MACRO';
method = 'SIMPALL';
materialType = 'ISOTROPIC';
initial_case = 'full';
cost = {'compliance'};
weights = 1;
constraint = {'volume'};
optimizer = 'IPOPT'; incrementFactor = 1;
filterType = 'P1';
constraint_case = 'INEQUALITY';

nsteps = 1;
Vfrac_final = 0.2;
Perimeter_target = 1;
optimality_final = 1e-3;
constr_final =1e-3;

Vfrac_initial = 1;
optimality_initial = 1e-3;
constr_initial = 1e-3;
TOL.rho_plus = 1;
TOL.rho_minus = 0;
TOL.E_plus = 1;
TOL.E_minus = 1e-3;
TOL.nu_plus = 1/3;
TOL.nu_minus = 1/3;