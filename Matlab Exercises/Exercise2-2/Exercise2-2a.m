%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.2 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Considerare l?immagine sintetica della barra. Calcolare la mappa delle 
% ampiezze e delle direzioni dei punti di edge candidati, operando sull?
% immagine senza rumore con un filtraggio derivativo tipo gradiente di 
% Roberts e di Sobel. Visualizzare i risultati, e riportare le osservazioni
% nelle conclusioni;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.2 (a)','NumberTitle','off');

image = zeros(30,30);
image(5:29, 13:17)=1.;

% Roberts
mascheraX = [1 0;0 -1];
mascheraY = [0 -1;1 0];
imageDXR = imfilter(image,mascheraX);
imageDYR = imfilter(image,mascheraY);
imageAmpR = abs(imageDXR) + abs(imageDYR);
subplot(3,2,1:2), imshow(image,'InitialMagnification', 'fit');
title('Immagine originale');
subplot(3,2,3), imshow(imageAmpR,'InitialMagnification', 'fit'); 
title('Mappa ampiezze (Roberts)');
subplot(3,2,4), quiver(imageDXR,imageDYR), grid;
title('Mappa direzioni di edge (Roberts)');

% Sobel
maschera1 = fspecial('sobel');
maschera = transpose(maschera1);
imageDXS = imfilter(image,maschera1);
imageDYS = imfilter(image,h1);
imageAmpS = abs(imageDXS) + abs(imageDYS);
subplot(3,2,5), imshow(imageAmpS,'InitialMagnification', 'fit'); 
title('Mappa ampiezze (Sobel)');
subplot(3,2,6), quiver(imageDXS,imageDYS), grid;
title('Mappa direzioni di edge (Sobel)');