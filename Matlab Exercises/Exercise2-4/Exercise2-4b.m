%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.4 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Calcolare psnr, snr e MSE per stimare il rapporto segnale-rumore dell'
% immagine prima e dopo il filtraggio di Laplace. Prima del filtraggio 
% prendere come riferimento l'immagine sorgente senza rumore; dopo il 
% filtraggio ricalcolare le tre stime prendendo come riferimento l'immagine
% iniziale con rumore. Riportare i risultati in un'unica tabella usando 
% uitable().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.4 (b)','NumberTitle','off');

msePrima = immse(imnoised, img);
[psnrPrima, snrPrima] = psnr(noise, image);
 
mseDopo = immse(immAmpS, noise);
[psnrDopo, snrDopo] = psnr(immAmpS, noise);
 
data = {msePrima, mseDopo; psnrPrima, psnrDopo; snrPrima, snrDopo};
uit = uitable();
uit.ColumnName = {'Prima', 'Dopo'};
uit.RowName = {'MSE', 'PSNR', 'SNR'};
uit.Data = data;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
