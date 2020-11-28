%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.5 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Binarizzare l?immagine della correlazione tramite sogliatura usando la 
% imbinarize() con valore di soglia thresh=0.8. Visualizzare l?immagine 
% binarizzata.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.5 (c)','NumberTitle','off');

image = imread('text.png'); 
imageE = imcrop(image,[31 12 8 10]);

normalizz = normxcorr2(imageE,image);
normalizz = mat2gray(normalizz);
imageImbin = imbinarize(normalizz,0.8);
imshow(imageImbin, 'InitialMagnification', 'fit'), 
title('Immagine imbinarize() (Threshold = 0.8)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%