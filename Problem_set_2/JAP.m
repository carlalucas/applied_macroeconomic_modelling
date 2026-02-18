[japan_data, ~, Time] = call_dbnomics('OECD/DSD_NAMAIN1@DF_QNA/Q.Y.JPN.S1.S1.B1G._Z._T._Z.XDC.L.LA.T0101', ...
    'OECD/DSD_PRICES@DF_PRICES_ALL/JPN.Q.N.CPI.IX._T.S._Z', ...
    'OECD/DSD_KEI@DF_KEI/JPN.Q.IRSTCI.PA._Z._Z._Z')

%plot(japan_data(:,2))

gy = japan_data(2:end,2)./japan_data(1:end-1,2)-1; 
gy = diff(log(japan_data(:,2)));
figure;
plot(Time(2:end), gy)
title('Output growth')

pi = diff(log(japan_data(:,3))); 
figure; 
plot(Time(2:end), pi)
title('Inflation')

r = japan_data(:,4)/400;
figure;
plot(Time, r)
title('Interest rate')