%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.3 (2)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usare la procedura MATLAB grayslice() per partizionare la scala dei 
% livelli di grigio in 128 e in 64 bande. Visualizzare le due immagini 
% risultanti ciascuna col proprio istogramma;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.3 (2)','NumberTitle','off');

img = imread('westconcordaerial.png'); 
img_gray = rgb2gray(img);

% partizione in 128 bande
img128 = grayslice(img_gray, 128);
subplot(2,2,1), imshow(img128), title('Immagine 128 bande');
subplot(2,2,2), imhist(img128), grid, title('Istogramma - Imm. 128 bande');

% partizione in 64 bande
img64 = grayslice(img_gray, 64);
subplot(2,2,3), imshow(img64), title('Immagine 64 bande'); 
subplot(2,2,4), imhist(img64), grid, title('Istogramma - Imm. 64 bande');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%