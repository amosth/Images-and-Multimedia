%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.2 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% All?immagine della barra aggiungere rumore gaussiano con varianza=0.01. 
% Ripetere il calcolo delle mappe di edge candidati con filtraggi di 
% Roberts e Sobel. Visualizzare i risultati e riportare le osservazioni 
% nelle conclusioni;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.2 (b)','NumberTitle','off');

image = zeros(30,30);
image(5:24, 13:17)=1.;
noise = imnoise(image,'gaussian',0,0.01);

% Roberts
mascheraX = [1 0;0 -1];
mascheraY = [0 -1;1 0];
imageDXR = imfilter(noise,mascheraX); 
imageDYR = imfilter(noise,mascheraY); 
imageAmpR = abs(imageDXR) + abs(imageDYR);
subplot(2,2,1), imshow(image,'InitialMagnification', 'fit'); 
title('Immagine originale');
subplot(2,2,2), imshow(noise,'InitialMagnification', 'fit'); 
title('Immagine originale (Rumore = 0.01)');
subplot(2,2,3), imshow(imageAmpR,'InitialMagnification', 'fit'); 
title('Mappa ampiezze (Roberts)');

% Sobel
maschera1 = fspecial('sobel');
maschera2 = transpose(maschera1);
imageDXS = imfilter(noise,maschera1);
imageDYS = imfilter(noise,maschera2);
imageAmpS = abs(imageDXS) + abs(imageDYS);
subplot(2,2,4), imshow(imageAmpS,'InitialMagnification', 'fit'); 
title('Mappa ampiezze (Sobel)');