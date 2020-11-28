%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.9 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Effettuare l?inversione oggetto-sfondo; binarizzare l?immagine; 
% aggiungere alla immagine binarizzata tre rettangoli pieni disgiunti tra 
% loro e dagli altri oggetti dell?immagine. Visualizzare: l?immagine 
% originale; il suo istogramma; l?immagine binarizzata; l?immagine 
% modificata con l?aggiunta dei rettangoli;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.9 (a)','NumberTitle','off');

image = imread('circlesBrightDark.png'); 

imageInv = imcomplement(image);
imageBin = imbinarize(imageInv);

imageBin(80:160,60:200) = 1.;
imageBin(230:360,90:130) = 1.;
imageBin(430:460,40:210) = 1.;

subplot(3,2,1), imshow(image), title('Immagine orginiale');
subplot(3,2,2), histogram(image), grid, title('Istogramma - Imm. orginiale'); 
subplot(3,2,3), imshow(imageInv), title('Immagine invert. + binariz.');
subplot(3,2,4), histogram(imageInv), grid, title('Istogramma - Imm. invert. + binariz.');
subplot(3,2,5), imshow(imageBin), title('Immagine invert. + binariz. + rett.');
subplot(3,2,6), histogram(imageBin), grid, title('Istogramma - Imm. invert. + binariz. + rett.');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

