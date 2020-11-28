%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.4 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Effettuare il filtraggio di Laplace dell'immagine reale 'coins.png'. 
% Visualizzare l'immagine sorgente; la mappa delle ampiezze; la mappa 
% stessa in modalità grafica usando la mesh(); la mappa dopo aver eliminato
% i valori negativi (passo (c) precedente).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.4 (d)','NumberTitle','off');
 
image = imread('coins.png');
 
maschera1 = fspecial('laplacian',0.2);
maschera2 = transpose(maschera1);
imageDX = imfilter(image,maschera1);
imageDY = imfilter(image,maschera2);
immAmp = imageDX + imageDY;
 
imageAmpInvBin = imbinarize(immAmp,0.2);
 
subplot(2,2,1), imshow(image), title('Immagine originale');
subplot(2,2,2), imshow(immAmp), title('Imm. filtrata');
subplot(2,2,3), mesh(immAmp), title('Mappa imm. filtrata');
subplot(2,2,4), mesh(imageAmpInvBin), title('Mappa imm. filtrata (valori>0)');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
