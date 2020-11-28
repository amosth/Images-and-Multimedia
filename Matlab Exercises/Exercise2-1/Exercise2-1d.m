%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.1 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Ripetere i calcoli effettuati ai punti (b), (c) con lo stesso operatore 
% di media (average) e maschere di dimensioni 5x5, 9x9. Non visualizzare le
% immagini. Usando la procedura uitable() riportare in un?unica tabella i 
% seguenti dati:
% 1) Le stime dell?MSE per immagini con rumore basso-alto non filtrate 
%    (riportare le stime già effettuate al punto (c1));
% 2) Le stime MSE per le immagini con rumore basso-alto, filtrate con le 
%    diverse maschere: 3x3 (già al punto (c2)); 5x5 ; 9x9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.1 (d)','NumberTitle','off');

scacchi = double((checkerboard(32) > 0.5));

noise01 = imnoise(scacchi,'gaussian',0,0.1); 
noise1 = imnoise(scacchi,'gaussian',0,1);

% sostituire 5 per maschera 5x5 con 9 per maschera 9x9
avg = fspecial('average',9);
filtrata01 = double(imfilter(noise01,avg)); 
filtrata1 = double(imfilter(noise1,avg));

mse01 = immse(noise01, scacchi);
mse1 = immse(noise1, scacchi); 
msefiltrata01 = immse(filtrata01, scacchi); 
msefiltrata1 = immse(filtrata1, scacchi);
data = {mse01; msefiltrata01; mse1; msefiltrata1};
uit = uitable();
uit.ColumnName = {'MSE'};
uit.RowName = {'R. basso', 'R. basso (filtrato 9x9)', 'R. alto', 'R. alto (filtrato 9x9)'}; 
uit.Data = data;