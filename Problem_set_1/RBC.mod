var k c a; 
varexo eta; 
parameters beta alpha delta rho_A std_A k1 k2 k3 c1 c2 Kss Css; 

// Initialisation des paramètres
beta = 0.99; 
alpha = 0.3; 
rho_A = 0.95; 
std_A = 0.01; 
delta = 0.025;

// Calculs des paramètres en régime permanent (Steady State)
Kss = ((1/beta - (1-delta))/alpha)^(1/(alpha-1)); 
Css = Kss^alpha - delta*Kss; 

k1 = Kss^(alpha-1)*rho_A; 
k2 = Kss^(alpha-1)*alpha + (1 - delta); 
k3 = Css/Kss;
c1 = beta*alpha*Kss^(alpha-1);
c2 = beta*alpha*(alpha-1)*Kss^(alpha-1); 

model(linear);
    k = k1*a + k2*k(-1) - k3*c; 
    c = c(+1) - c1*a(+1) - c2*k; 
    a = rho_A*a(-1) + eta;
end; 

shocks;
    var eta ; stderr std_A; 
end;

stoch_simul(order=1, periods=2100);