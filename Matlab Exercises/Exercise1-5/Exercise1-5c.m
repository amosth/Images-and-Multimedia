%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.5 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Visualizzare i risultati in forma di tabella (funzione uitable())
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

data = {mse1, mse2, mse3; snr1, snr2, snr3; psnr1, psnr2, psnr3};
uit = uitable(figure('Name','Esercizio 1.5 (c)','NumberTitle','off'));
uit.ColumnName = {'varianza = 0.01','varianza = 0.1','varianza = 1'}; uit.RowName = {'MSE','SNR','PSNR'};
uit.Data = data;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



