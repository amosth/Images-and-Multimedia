%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.1 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% L?immagine della scacchiera - checkerboard() - deve essere rappresentata 
% in forma binaria e risoluzione 256x256 pixel. Applicare alla scacchiera 
% rumore additivo gaussiano a media nulla, con varianza 0.1 (rumore basso);
% e con varianza 1. (rumore alto). Visualizzare l?immagine sorgente della 
% scacchiera e le due immagini con rumore, assieme ai rispettivi istogrammi
% dei livelli di grigio;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.1 (a)','NumberTitle','off');

scacchi = (checkerboard(32) > 0.5);
noise01 = imnoise(double(scacchi),'gaussian',0,0.1);
noise1 = imnoise(double(scacchi),'gaussian',0,1);

subplot(3,2,1);
imshow(scacchi, 'InitialMagnification', 'fit'); 
title('Immagine originale');

subplot(3,2,2);
histogram(scacchi), grid;
title('Istogramma - Imm. originale');

subplot(3,2,3);
imshow(noise01, 'InitialMagnification', 'fit'); 
title('Immagine (varianza = 0.1)');

subplot(3,2,4);
histogram(noise01), grid;
title('Istogramma - Imm. (varianza = 0.1)');

subplot(3,2,5);
imshow(noise1, 'InitialMagnification', 'fit'); 
title('Immagine (varianza = 1)');

subplot(3,2,6);
histogram(noise1), grid;
title('Istogramma - Imm. (varianza = 1)');
