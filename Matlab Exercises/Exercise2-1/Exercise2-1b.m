%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.1 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Effettuare il filtraggio delle due immagini con rumore (non dell?immagine
% sorgente!) tramite filtro di media (average) con maschera 3x3. 
% Visualizzare:
% 1) Immagine sorgente; con rumore basso; filtrata;
% 2) Immagine sorgente; con rumore alto; filtrata.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.1 (b)','NumberTitle','off');

scacchi = (checkerboard(32) > 0.5);

noise01 = imnoise(double(scacchi),'gaussian',0,0.1);
noise1 = imnoise(double(scacchi),'gaussian',0,1);

avg = fspecial('average',3); 
filtrata01 = imfilter(noise01,avg); 
filtrata1 = imfilter(noise1,avg);

subplot(2,3,1), imshow(scacchi, 'InitialMagnification', 'fit'), title('Immagine originale'); 

subplot(2,3,2), imshow(noise01, 'InitialMagnification', 'fit'), title('Immagine - Rumore basso');
subplot(2,3,3), imshow(filtrata01, 'InitialMagnification', 'fit'), title('Immagine filtrata'); 
subplot(2,3,5), imshow(noise1, 'InitialMagnification', 'fit'), title('Immagine - Rumore alto');
subplot(2,3,6), imshow(filtrata1, 'InitialMagnification', 'fit'), title('Immagine filtrata');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%