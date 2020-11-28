%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.2 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Convertirla da codifica RGB in codifica HSV (Hue, Saturation, Value) 
% usando la procedura MATLAB rgb2hsv(). Visualizzare l?originale RGB e la 
% trasformata HSV coi rispettivi istogrammi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.2 (a)','NumberTitle','off');

peppers_rgb = imread('peppers.png');
peppers_hsv = rgb2hsv(peppers_rgb);

% immagine originale
subplot(2,2,1);
imshow(peppers_rgb)
title('Immagine (versione RGB)'); subplot(2,2,2);
imhist(peppers_rgb), grid; title('Istogramma  - Imm. (versione RGB)');
% immagine trasformata
subplot(2,2,3);
imshow(peppers_hsv)
title('Immagine (versione HSV)'); subplot(2,2,4);
imhist(peppers_hsv), grid; title('Istogramma - Imm. (versione HSV)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%