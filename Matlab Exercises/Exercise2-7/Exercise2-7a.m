%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.7 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Convertire 'geomTest.png' nella sua negativa. Visualizzare l'immagine e 
% la negativa, ciascuna col proprio istogramma;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.7 (a)','NumberTitle','off');

image = imread('geomTest.png');
image = rgb2gray(image);
image = logical(image);
image_ = -image;
 
subplot(2,2,1), imshow(image, []), title('Imm. (+)');
subplot(2,2,3), histogram(image), grid, title('Istogramma - Imm. (+)');
 
subplot(2,2,2), imshow(image_, []), title('Imm. (-)');
subplot(2,2,4), histogram(image_), grid, title('Istogramma - Imm. (-)');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

