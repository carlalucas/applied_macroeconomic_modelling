% Récupération des données pour le Japon via DBnomics
% GDP (B1_GE), Deflator (DNBSA), et Short-term Interest Rate (IR3TIB01)
[output_table,~,T] = call_dbnomics('OECD/QNA/JPN.B1_GE.CQRSA.Q','OECD/QNA/JPN.B1_GE.DNBSA.Q','OECD/KEI/IR3TIB01.JPN.ST.Q');
% Colonnes : 1=Date, 2=PIB nominal, 3=Déflateur, 4=Taux nominal

% Sélection des indices sans NaN
idx             = find(~isnan(sum(output_table(:,2:end),2)));
output_table    = output_table(idx,:);
T               = T(idx);

% Normalisation du déflateur (base 1 en 2015)
id2015 = find(T==2015);
if isempty(id2015); id2015 = 1; end % Sécurité si 2015 n'est pas dans l'échantillon
def = output_table(:,3)/output_table(id2015,3);

%% Calcul des variables pour le modèle DSGE
% Croissance du PIB réel (log-différence)
gy_obs  = diff(log(output_table(:,2)./(def)));

% Taux d'inflation (log-différence du déflateur)
pi_obs  = diff(log(def));

% Taux d'intérêt nominal trimestriel (annualisé / 400)
r_obs   = output_table(2:end,4)/400;

T = T(2:end);

% Sauvegarde des variables
save myobs_JPN gy_obs pi_obs r_obs T;

%% Visualisation
figure;
subplot(3,1,1)
plot(T,gy_obs)
xlim([min(T) max(T)]);
title('output growth (japan)')

subplot(3,1,2)
plot(T,pi_obs)
xlim([min(T) max(T)]);
title('inflation rate (japan)')

subplot(3,1,3)
plot(T,r_obs)
xlim([min(T) max(T)]);
title('nominal rate (japan)')