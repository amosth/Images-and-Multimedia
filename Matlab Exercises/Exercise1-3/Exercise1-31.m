%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.3 (1)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Convertire l?immagine in un?altra a livelli di grigio tramite la 
% procedura rgb2gray(). Visualizzare l?immagine sorgente, quella convertita
% in livelli di grigio con la propria scala e il proprio istogramma;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.3 (1)','NumberTitle','off');

img = imread('westconcordaerial.png');
img_gray = rgb2gray(img);

subplot(2,2,1);
imshow(img), colorbar, title('Immagine originale + scala');

subplot(2,2,2);
imhist(img), grid, title('Istogramma - Imm. originale');

subplot(2,2,3);
imshow(img_gray), colorbar, title('Immagine gray + scala');

subplot(2,2,4);
imhist(img_gray), grid, title('Istogramma - Imm. gray');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%