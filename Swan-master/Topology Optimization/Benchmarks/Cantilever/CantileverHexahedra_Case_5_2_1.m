filename='Cantileverbeam_Hexahedra_Linear_Structured';
ptype = 'MACRO';
method = 'SIMPALL';
materialType = 'ISOTROPIC';
initial_case = 'holes';
cost = {'compliance', 'perimeter'};
weights = [1 0.001];
constraint = {'volumeConstraint'};
optimizer = 'HAMILTON-JACOBI'; 
incrementFactor = 1;
designVariable = 'LevelSet';
filterType = 'P1';

nsteps = 1;
allow = 0;
Vfrac_final = 0.5;
Perimeter_target=3.5;
optimality_final =1e-3;
constr_final =1e-3;

BCscale_factor = 0.3;
HJiter0 = 1;
e2 = 10;
N_holes = [12 5 5];
R_holes = 0.9;
phase_holes = [0 0 0];

Vfrac_initial = 0.8;
optimality_initial = 1e-3;
constr_initial = 1e-3;

TOL.rho_plus = 1;
TOL.rho_minus = 0;
TOL.E_plus = 1;
TOL.E_minus = 1e-3;

% maxiter = 1;
TOL.nu_plus = 0.3;
TOL.nu_minus = 0.3;

plotting = 1;
printing = 0;
monitoring = 1;
monitoring_interval = 1;