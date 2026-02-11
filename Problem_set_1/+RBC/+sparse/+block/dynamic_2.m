function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(y(4))-(params(6)*y(6)+params(7)*y(1)-params(8)*y(5));
  residual(2)=(y(5))-(y(8)-params(9)*y(9)-y(4)*params(10));
if nargout > 3
    g1_v = NaN(6, 1);
g1_v(1)=(-params(7));
g1_v(2)=1;
g1_v(3)=params(10);
g1_v(4)=params(8);
g1_v(5)=1;
g1_v(6)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 6);
end
end
