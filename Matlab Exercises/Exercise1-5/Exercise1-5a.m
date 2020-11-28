%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.5 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Aggiungere rumore gaussiano a media nulla, con tre livelli diversi di 
% varianza: 0.01, 0.1, 1. Visualizzare l'immagine sorgente, le tre 
% immagini rumorose e i quattro istogrammi rispettivi. Per la simulazione 
% del rumore usare la funzione MATLAB imnoise()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
img = zeros(30,30);
img(5:24, 14:17)=1.;
 
figure('Name','Esercizio 1.5 (a)','NumberTitle','off');

% immagine originale + istogramma
subplot(4,2,1);
imshow(img, 'InitialMagnification', 'fit'); 
title('Immagine originale');
subplot(4,2,2);
histogram(img), grid, title('Istogramma - Imm. originale');

% immagine (varianza = 0.01) + istogramma
subplot(4,2,3);
noise1 = imnoise(img, 'gaussian', 0, 0.01);
imshow(noise1, 'InitialMagnification', 'fit');
title('Immagine (varianza = 0.01)');
subplot(4,2,4);
imhist(noise1), grid, title('Istogramma - Imm. (varianza = 0.01)');

% immagine (varianza = 0.1) + istogramma
subplot(4,2,5);
noise2 = imnoise(img, 'gaussian', 0, 0.1);
imshow(noise2, 'InitialMagnification', 'fit');
title('Immagine (varianza = 0.1)');
subplot(4,2,6);
imhist(noise2), grid, title('Istogramma - Imm. (varianza = 0.1)');

% immagine (varianza = 1) + istogramma
subplot(4,2,7);
noise3 = imnoise(img, 'gaussian', 0, 1);
imshow(noise3, 'InitialMagnification', 'fit');
title('Immagine (varianza = 1)');
subplot(4,2,8);
imhist(noise3), grid, title('Istogramma - Imm. (varianza = 1)');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

