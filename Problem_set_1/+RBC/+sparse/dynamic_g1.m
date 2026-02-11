function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = RBC.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(11, 1);
g1_v(1)=(-params(7));
g1_v(2)=(-params(4));
g1_v(3)=1;
g1_v(4)=params(10);
g1_v(5)=params(8);
g1_v(6)=1;
g1_v(7)=(-params(6));
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=params(9);
g1_v(11)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 10);
end
