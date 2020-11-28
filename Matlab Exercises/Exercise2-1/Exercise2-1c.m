%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.1 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Stimare quantitativamente l?effetto del rumore e del filtraggio di media 
% usando l?MSE, avendo preso come riferimento l?immagine sorgente. In 
% particolare:
% 1) Stimare l?MSE delle immagini con rumore basso-alto, prima del 
%    filtraggio;
% 2) Stimare l?MSE delle immagini che avevano rumore basso-alto, dopo il 
%    filtraggio; Riportare i risultati in un?unica tabella usando la 
%    procedura uitable().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.1 (c)','NumberTitle','off');

scacchi = double((checkerboard(32) > 0.5));

noise01 = imnoise(scacchi,'gaussian',0,0.1);
noise1 = imnoise(scacchi,'gaussian',0,1);

avg = fspecial('average');
filtrata01 = double(imfilter(noise01,avg)); 
filtrata1 = double(imfilter(noise1,avg));

mse01 = immse(noise01, scacchi);
mse1 = immse(noise1, scacchi); 
msefiltrata01 = immse(filtrata01, scacchi); 
msefiltrata1 = immse(filtrata1, scacchi);

data = {mse01; msefiltrata01; mse1; msefiltrata1}; 
uit = uitable();
uit.ColumnName = {'MSE'};
uit.RowName = {'Rumore basso', 'Rumore basso (filtrato)', 'Rumore alto', 'Rumore alto (filtrato)'}; 
uit.Data = data;
