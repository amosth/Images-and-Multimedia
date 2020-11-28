%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.2 (e)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Considerare l?immagine ?circuit.tif?. Sulla sola mappa delle ampiezze 
% degli edge candidati effettuare una sogliatura (binarizzazione) tramite 
% la im2bw(); sperimentare tre diversi valori di soglia: 0.4, 0.6, 0.9. 
% Visualizzare le mappe sogliate (binarizzate).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.2 (e)','NumberTitle','off');
image = imread('circuit.tif');

% Sobel
maschera1 = fspecial('sobel');
maschera2 = transpose(maschera1);
imageDXS = imfilter(image,maschera1);
imageDYS = imfilter(image,maschera2);
immS = abs(imageDXS) + abs(imageDYS); 
immSbw04 = im2bw(immS,0.4); 
immSbw06 = im2bw(immS,0.6); 
immSbw09 = im2bw(immS,0.9);
subplot(2,6,1:3), imshow(image), title('Immagine originale');
subplot(2,6,4:6), imshow(immS), title('Mappa ampiezze (Sobel)'); 
subplot(2,6,7:8), imshow(immSbw04), title('Mappa amp. (Sobel) - Threshold = 0.4');
subplot(2,6,9:10), imshow(immSbw06), title('Mappa amp. (Sobel) - Threshold = 0.6');
subplot(2,6,11:12), imshow(immSbw09), title('Mappa amp. (Sobel) - Threshold = 0.9');