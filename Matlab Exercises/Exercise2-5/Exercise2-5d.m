%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.5 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Ripetere i calcoli della correlazione (passo (b)) e della binarizzazione
% (passo (c)) avendo ruotato di 90° l?immagine ritagliata del carattere ?e?
% con la imrotate(). Visualizzare i nuovi risultati come già fatto per la 
% consegna (b).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.5 (d)','NumberTitle','off');

image = imread('text.png'); 
imageE = imcrop(image,[31 12 8 10]);

imageErotate = imrotate(imageE,90);
normalizzRotate = normxcorr2(imageErotate,image);
normalizzRotate = mat2gray(normalizzRotate);
subplot(1,4,1), imshow(normalizzRotate), title('Correlazione normalizzata (+90°)');
subplot(1,4,2), imhist(normalizzRotate), title('Istogramma (+90°)');
subplot(1,4,3), surf(normalizzRotate), title('Grafica 3D (+90°)'); 
shading flat;
imageImbinRotate = imbinarize(normalizzRotate,0.8);
subplot(1,4,4), imshow(imageImbinRotate), title('Immagine imbinarize() (+90°)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%