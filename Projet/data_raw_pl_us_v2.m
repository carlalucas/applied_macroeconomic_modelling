%% 1. INITIALISATION ET CRÉATION DU DOSSIER
clear; clc; close all;
fprintf('--- Démarrage : Export dans le dossier "résultats" ---\n');

% Création du dossier s'il n'existe pas déjà
if ~exist('résultats', 'dir')
    mkdir('résultats');
    fprintf(' -> Dossier "résultats" créé.\n');
end

% Fonctions helpers pour l'affichage graphique (visuel uniquement)
get_q_date = @(dates) datenum(replace(dates, ...
    {'-Q1', '-Q2', '-Q3', '-Q4', 'Q1', 'Q2', 'Q3', 'Q4'}, ...
    {'-01', '-04', '-07', '-10', '-01', '-04', '-07', '-10'}), 'yyyy-mm');
get_m_date = @(dates) datenum(dates, 'yyyy-mm');


%% ==============================================================================
%% BLOC 1 : ÉTATS-UNIS (US)
%% ==============================================================================
fprintf('\n[1/2] Récupération US...\n');

try
    % 1. Credit (BIS)
    [~, T_cre] = call_dbnomics('BIS/WS_TC/Q.US.N.A.M.USD.A');
    T_cre.Properties.VariableNames = {'US_Credit'};

    % 2. Taux (FED)
    [~, T_rate] = call_dbnomics('FED/H15/RIFSPFF_N.M');
    T_rate.Properties.VariableNames = {'US_Rate'};

    % 3. PIB (OECD)
    [~, T_gdp] = call_dbnomics('OECD/MEI/USA.NAEXKP01.IXOBSA.Q');
    T_gdp.Properties.VariableNames = {'US_GDP'};

    % 4. Investissement (OECD)
    [~, T_inv] = call_dbnomics('OECD/MEI/USA.NAEXKP04.IXOBSA.Q');
    T_inv.Properties.VariableNames = {'US_Inv'};

    % 5. CPI (OECD)
    [~, T_cpi] = call_dbnomics('OECD/MEI/USA.CPALTT01.IXOBSA.Q');
    T_cpi.Properties.VariableNames = {'US_CPI'};

    % --- FUSION BRUTE ---
    T_US = T_cre;
    T_US = outerjoin(T_US, T_rate, 'Keys', 'Row', 'MergeKeys', true);
    T_US = outerjoin(T_US, T_gdp,  'Keys', 'Row', 'MergeKeys', true);
    T_US = outerjoin(T_US, T_inv,  'Keys', 'Row', 'MergeKeys', true);
    T_US = outerjoin(T_US, T_cpi,  'Keys', 'Row', 'MergeKeys', true);

    % EXPORT DANS LE DOSSIER RÉSULTATS
    writetable(T_US, 'résultats/data_US.csv', 'WriteRowNames', true);
    fprintf(' -> résultats/data_US.csv exporté.\n');
    disp('--- Stats US ---'); summary(T_US);

    % GRAPHIQUES
    figure('Name', 'US Raw Data', 'Color', 'w');
    subplot(2,3,1); plot(get_q_date(T_gdp.Properties.RowNames), T_gdp.US_GDP, 'b'); title('GDP (Vol. Index)'); axis tight; grid on; datetick('x','yyyy');
    subplot(2,3,2); plot(get_q_date(T_inv.Properties.RowNames), T_inv.US_Inv, 'r'); title('Invest'); axis tight; grid on; datetick('x','yyyy');
    subplot(2,3,3); plot(get_q_date(T_cpi.Properties.RowNames), T_cpi.US_CPI, 'k'); title('CPI'); axis tight; grid on; datetick('x','yyyy');
    subplot(2,3,4); plot(get_q_date(T_cre.Properties.RowNames), T_cre.US_Credit, 'g'); title('Credit'); axis tight; grid on; datetick('x','yyyy');
    subplot(2,3,5); 
    try d=get_m_date(T_rate.Properties.RowNames); catch, d=datenum(T_rate.Properties.RowNames); end
    plot(d, T_rate.US_Rate, 'm'); title('Rate (Fed Funds)'); axis tight; grid on; datetick('x','yyyy');
    
    % SAUVEGARDE GRAPHIQUE
    saveas(gcf, 'résultats/graph_US.png');

catch ME
    warning('Erreur US : %s', ME.message);
end


%% ==============================================================================
%% BLOC 2 : POLOGNE (PL)
%% ==============================================================================
fprintf('\n[2/2] Récupération POLOGNE...\n');

try
    % 1. CPI (OECD - Code corrigé IXNB)
    [~, T_pl_cpi] = call_dbnomics('OECD/MEI/POL.CPALTT01.IXNB.Q');
    T_pl_cpi.Properties.VariableNames = {'PL_CPI'};

    % 2. PIB (OECD)
    [~, T_pl_gdp] = call_dbnomics('OECD/MEI/POL.NAEXKP01.IXOBSA.Q');
    T_pl_gdp.Properties.VariableNames = {'PL_GDP'};

    % 3. Investissement (OECD)
    [~, T_pl_inv] = call_dbnomics('OECD/MEI/POL.NAEXKP04.IXOBSA.Q');
    T_pl_inv.Properties.VariableNames = {'PL_Inv'};

    % 4. Taux (OECD - 3M Interbank)
    [~, T_pl_rate] = call_dbnomics('OECD/MEI/POL.IR3TIB01.ST.M');
    T_pl_rate.Properties.VariableNames = {'PL_Rate'};

    % 5. Or (IMF)
    [~, T_pl_gold] = call_dbnomics('IMF/IFS/M.PL.RAFAGOLDV_OZT');
    T_pl_gold.Properties.VariableNames = {'PL_Gold'};

    % --- FUSION BRUTE ---
    T_PL = T_pl_gdp;
    T_PL = outerjoin(T_PL, T_pl_inv, 'Keys', 'Row', 'MergeKeys', true);
    T_PL = outerjoin(T_PL, T_pl_cpi, 'Keys', 'Row', 'MergeKeys', true);
    T_PL = outerjoin(T_PL, T_pl_rate, 'Keys', 'Row', 'MergeKeys', true);
    T_PL = outerjoin(T_PL, T_pl_gold, 'Keys', 'Row', 'MergeKeys', true);
    
    % Essai Crédit BIS (optionnel)
    try
        [~, T_pl_cre] = call_dbnomics('BIS/WS_TC/Q.PL.N.A.M.USD.A');
        T_pl_cre.Properties.VariableNames = {'PL_Credit'};
        T_PL = outerjoin(T_PL, T_pl_cre, 'Keys', 'Row', 'MergeKeys', true);
    catch
        warning('Credit BIS PL non disponible (ignoré).');
    end

    % EXPORT DANS LE DOSSIER RÉSULTATS
    writetable(T_PL, 'résultats/data_PL.csv', 'WriteRowNames', true);
    fprintf(' -> résultats/data_PL.csv exporté.\n');
    disp('--- Stats PL ---'); summary(T_PL);

    % GRAPHIQUES
    figure('Name', 'PL Raw Data', 'Color', 'w');
    subplot(2,3,1); plot(get_q_date(T_pl_gdp.Properties.RowNames), T_pl_gdp.PL_GDP, 'b'); title('GDP (Vol. Index)'); axis tight; grid on; datetick('x','yyyy');
    subplot(2,3,2); plot(get_q_date(T_pl_inv.Properties.RowNames), T_pl_inv.PL_Inv, 'r'); title('Invest'); axis tight; grid on; datetick('x','yyyy');
    subplot(2,3,3); plot(get_q_date(T_pl_cpi.Properties.RowNames), T_pl_cpi.PL_CPI, 'k'); title('CPI (Index Base)'); axis tight; grid on; datetick('x','yyyy');
    
    subplot(2,3,4); 
    try d=get_m_date(T_pl_rate.Properties.RowNames); catch, d=datenum(T_pl_rate.Properties.RowNames); end
    plot(d, T_pl_rate.PL_Rate, 'm'); title('Rate (3M Interbank)'); axis tight; grid on; datetick('x','yyyy');
    
    subplot(2,3,5); 
    try d=get_m_date(T_pl_gold.Properties.RowNames); catch, d=datenum(T_pl_gold.Properties.RowNames); end
    plot(d, T_pl_gold.PL_Gold, 'Color', [0.85 0.6 0.1]); title('Gold Reserves (IMF)'); axis tight; grid on; datetick('x','yyyy');

    if exist('T_pl_cre','var')
        subplot(2,3,6); plot(get_q_date(T_pl_cre.Properties.RowNames), T_pl_cre.PL_Credit, 'g'); title('Credit'); axis tight; grid on; datetick('x','yyyy');
    end
    
    % SAUVEGARDE GRAPHIQUE
    saveas(gcf, 'résultats/graph_PL.png');

catch ME
    warning('Erreur PL : %s', ME.message);
end

fprintf('\n--- Terminé ---\n');