%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.3 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usare l?immagine ?blobs.png?. Calcolare la mappa di ampiezze di edge con 
% l?operatore di Sobel usando la edge() di MATLAB. Calcolare la stessa 
% mappa di ampiezze di edge di Sobel usando fspecial(), imfilter(). 
% Binarizzare quest?ultima mappa per selezionare i massimi delle ampiezze 
% (soglia=0.9). Visualizzare nella stessa finestra l?immagine sorgente e le
% due mappe di ampiezze.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.3 (a)','NumberTitle','off');

image = imread('blobs.png');

imageEdge = edge(image,'Sobel');

% Sobel
maschera1 = fspecial('sobel');
maschera2 = transpose(maschera1);
imageDXS = imfilter(image,maschera1);
imageDYS = imfilter(image,maschera2);
imageAmpS = abs(imageDXS) + abs(imageDYS); 
imageAmpS9 = im2bw(imageAmpS,0.9);
subplot(1,3,1), imshow(image), title('Immagine originale');
subplot(1,3,2), imshow(imageEdge), title('Mappa ampiezze - edge()'); 
subplot(1,3,3), imshow(imageAmpS9), title('Mappa ampiezze - Threshold = 0.9');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%