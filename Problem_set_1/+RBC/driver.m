%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'RBC';
M_.dynare_version = '6.5';
oo_.dynare_version = '6.5';
options_.dynare_version = '6.5';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eta'};
M_.exo_names_tex(1) = {'eta'};
M_.exo_names_long(1) = {'eta'};
M_.endo_names = cell(3,1);
M_.endo_names_tex = cell(3,1);
M_.endo_names_long = cell(3,1);
M_.endo_names(1) = {'k'};
M_.endo_names_tex(1) = {'k'};
M_.endo_names_long(1) = {'k'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'a'};
M_.endo_names_tex(3) = {'a'};
M_.endo_names_long(3) = {'a'};
M_.endo_partitions = struct();
M_.param_names = cell(12,1);
M_.param_names_tex = cell(12,1);
M_.param_names_long = cell(12,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'alpha'};
M_.param_names_tex(2) = {'alpha'};
M_.param_names_long(2) = {'alpha'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'rho_A'};
M_.param_names_tex(4) = {'rho\_A'};
M_.param_names_long(4) = {'rho_A'};
M_.param_names(5) = {'std_A'};
M_.param_names_tex(5) = {'std\_A'};
M_.param_names_long(5) = {'std_A'};
M_.param_names(6) = {'k1'};
M_.param_names_tex(6) = {'k1'};
M_.param_names_long(6) = {'k1'};
M_.param_names(7) = {'k2'};
M_.param_names_tex(7) = {'k2'};
M_.param_names_long(7) = {'k2'};
M_.param_names(8) = {'k3'};
M_.param_names_tex(8) = {'k3'};
M_.param_names_long(8) = {'k3'};
M_.param_names(9) = {'c1'};
M_.param_names_tex(9) = {'c1'};
M_.param_names_long(9) = {'c1'};
M_.param_names(10) = {'c2'};
M_.param_names_tex(10) = {'c2'};
M_.param_names_long(10) = {'c2'};
M_.param_names(11) = {'Kss'};
M_.param_names_tex(11) = {'Kss'};
M_.param_names_long(11) = {'Kss'};
M_.param_names(12) = {'Css'};
M_.param_names_tex(12) = {'Css'};
M_.param_names_long(12) = {'Css'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 3;
M_.param_nbr = 12;
M_.orig_endo_nbr = 3;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 3;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 3 0;
 0 4 6;
 2 5 7;]';
M_.nstatic = 0;
M_.nfwrd   = 1;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 3;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'k' ;
  2 , 'name' , 'c' ;
  3 , 'name' , 'a' ;
};
M_.mapping.k.eqidx = [1 2 ];
M_.mapping.c.eqidx = [1 2 ];
M_.mapping.a.eqidx = [1 2 3 ];
M_.mapping.eta.eqidx = [3 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 3];
M_.block_structure.block(1).variable = [ 3];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 2;
M_.block_structure.block(2).mfs = 2;
M_.block_structure.block(2).equation = [ 1 2];
M_.block_structure.block(2).variable = [ 1 2];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 6;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 3 4 6 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 1 2 1 2 2 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 3 3 4 4 6 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 2 2 4 6 6 7 ]);
M_.block_structure.variable_reordered = [ 3 1 2];
M_.block_structure.equation_reordered = [ 3 1 2];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 1 1;
 3 3;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 2;
 1 3;
 2 1;
 2 2;
 3 3;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 2 2;
 2 3;
];
M_.block_structure.dyn_tmp_nbr = 0;
M_.state_var = [3 1 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(3, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(12, 1);
M_.endo_trends = struct('deflator', cell(3, 1), 'log_deflator', cell(3, 1), 'growth_factor', cell(3, 1), 'log_growth_factor', cell(3, 1));
M_.NNZDerivatives = [11; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([1 3 1 2 1 2 1 3 2 2 3 ]);
M_.dynamic_g1_sparse_colval = int32([1 3 4 4 5 5 6 6 8 9 10 ]);
M_.dynamic_g1_sparse_colptr = int32([1 2 2 3 5 7 9 9 10 11 12 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'k'; 
'c'; 
'a'; 
};
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 3];
M_.block_structure_stat.block(1).variable = [ 3];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 2;
M_.block_structure_stat.block(2).mfs = 2;
M_.block_structure_stat.block(2).equation = [ 2 1];
M_.block_structure_stat.block(2).variable = [ 1 2];
M_.block_structure_stat.variable_reordered = [ 3 1 2];
M_.block_structure_stat.equation_reordered = [ 3 2 1];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 2;
 1 3;
 2 1;
 2 3;
 3 3;
];
M_.block_structure_stat.tmp_nbr = 0;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 2 2 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 3 4 ]);
M_.static_g1_sparse_rowval = int32([1 2 1 1 2 3 ]);
M_.static_g1_sparse_colval = int32([1 1 2 3 3 3 ]);
M_.static_g1_sparse_colptr = int32([1 3 4 7 ]);
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.3;
alpha = M_.params(2);
M_.params(4) = 0.95;
rho_A = M_.params(4);
M_.params(5) = 0.01;
std_A = M_.params(5);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(11) = ((1/M_.params(1)-(1-M_.params(3)))/M_.params(2))^(1/(M_.params(2)-1));
Kss = M_.params(11);
M_.params(12) = M_.params(11)^M_.params(2)-M_.params(3)*M_.params(11);
Css = M_.params(12);
M_.params(6) = M_.params(11)^(M_.params(2)-1)*M_.params(4);
k1 = M_.params(6);
M_.params(7) = 1-M_.params(3)+M_.params(2)*M_.params(11)^(M_.params(2)-1);
k2 = M_.params(7);
M_.params(8) = M_.params(12)/M_.params(11);
k3 = M_.params(8);
M_.params(9) = M_.params(11)^(M_.params(2)-1)*M_.params(1)*M_.params(2);
c1 = M_.params(9);
M_.params(10) = M_.params(11)^(M_.params(2)-1)*(M_.params(2)-1)*M_.params(1)*M_.params(2);
c2 = M_.params(10);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(5))^2;
options_.order = 1;
options_.periods = 2100;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
