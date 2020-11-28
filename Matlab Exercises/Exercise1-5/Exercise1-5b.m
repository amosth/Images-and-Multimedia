%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.5 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Rispetto all'immagine senza rumore presa come riferimento, calcolare l'
% errore quadratico medio MSE (funz. immse()); il rapporto segnale-rumore 
% di picco (PSNR); il rapporto segnale rumore (SNR) per i tre livelli di 
% rumore simulato. Per la stima di PSNR e SNR usare la funzione psnr()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% creazione immagine da una matrice di zeri
img = zeros(30,30);
img(5:24, 14:17)=1.;

noise1 = imnoise(img,'gaussian',0,0.01); 
mse1 = immse(noise1, img)
[psnr1, snr1] = psnr(noise1, img)

noise2 = imnoise(img,'gaussian',0,0.1); 
mse2 = immse(noise2, img)
[psnr2, snr2] = psnr(noise2, img)

noise3 = imnoise(img,'gaussian',0,1); 
mse3 = immse(noise3, img)
[psnr3, snr3] = psnr(noise3, img)

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%