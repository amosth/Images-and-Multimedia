%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.2 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Considerare l?immagine ?blobs.png? a cui aggiungere rumore gaussiano 
% additivo con varianza=0.1. Effettuare il calcolo delle sole ampiezze 
% degli edge candidati, usando l?operatore di gradiente di Sobel. 
% Visualizzare e riportare le osservazioni nelle conclusioni;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.2 (c)','NumberTitle','off');

image = double(imread('blobs.png'));

noise = imnoise(image,'gaussian',0,0.1);
% Sobel
maschera1 = fspecial('sobel');
maschera2 = transpose(maschera1);
imageDXS = imfilter(noise,maschera1);
imageDYS = imfilter(noise,maschera2);
imageAmpS = abs(imageDXS) + abs(imageDYS);
subplot(1,3,1), imshow(image), title('Immagine originale');
subplot(1,3,2), imshow(noise), title('Immagine originale (Rumore = 0.1)'); 
subplot(1,3,3), imshow(imageAmpS), title('Mappa ampiezze (Sobel)');