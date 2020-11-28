%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.2 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Considerare l?immagine ?circuit.tif? senza aggiunta di rumore. Calcolare 
% la mappa delle ampiezze e delle direzioni degli edge candidati tramite 
% gradiente di Sobel;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.2 (d)','NumberTitle','off');
image = imread('circuit.tif');

% Sobel
maschera1 = fspecial('sobel');
maschera2 = transpose(maschera1);
imageDXS = imfilter(img,maschera1);
imageDYS = imfilter(img,maschera2);
imageAmpS = abs(imageDXS) + abs(imageDYS);
subplot(1,2,1), imshow(img), title('Immagine originale'); 
subplot(1,2,2), imshow(imageAmpS), title('Mappa ampiezze (Sobel)');