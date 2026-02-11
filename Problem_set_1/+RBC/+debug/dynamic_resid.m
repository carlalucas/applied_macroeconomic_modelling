function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(0, 1);
lhs = NaN(3, 1);
rhs = NaN(3, 1);
lhs(1) = y(4);
rhs(1) = params(6)*y(6)+params(7)*y(1)-params(8)*y(5);
lhs(2) = y(5);
rhs(2) = y(8)-params(9)*y(9)-y(4)*params(10);
lhs(3) = y(6);
rhs(3) = params(4)*y(3)+x(1);
end
