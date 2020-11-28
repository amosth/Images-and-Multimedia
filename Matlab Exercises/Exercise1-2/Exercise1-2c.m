%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.2 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Desaturare l'immagine HSV, cioè azzerare il canale S; riconvertire l'
% immagine alla codifica RGB e visualizzare l'immagine risultante; 
% visualizzare gli istogrammi della HSV desaturata;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.2 (c)','NumberTitle','off');

peppers_rgb = imread('peppers.png');
peppers_hsv = rgb2hsv(peppers_rgb);

% desaturazione
peppers_hsv(:,:,2) = 0;
desaturata = hsv2rgb(peppers_hsv); 
imshow(desaturata, 'InitialMagnification', 'fit');

% immagine originale desaturata + istogramma
subplot(2,2,1); 
imshow(desaturata) 
title('Immagine (versione RGB) desaturata'); 
subplot(2,2,2); 
imhist(desaturata), grid;
title('Istogramma - Imm. (v. RGB) desaturata');

% immagine trasformata desaturata + istogramma
subplot(2,2,3);
imshow(peppers_hsv)
title('Immagine (versione HSV) desaturata'); 
subplot(2,2,4);
imhist(peppers_hsv), grid;
title('Istogramma - Imm. (v. HSV) desaturata');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%