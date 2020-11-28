%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.7 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usando la procedura bwboundaries() estrarre il numero di oggetti Nobj; 
% i contorni di ciascun oggetto codificati in BoundObj; l'array di 
% etichette imgLabel. Visualizzare soltanto l'immagine RGB delle etichette,
% con sovrapposti i contorni degli oggetti;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.7 (b)','NumberTitle','off');

image = imread('geomTest.png');
image = rgb2gray(image);
imageBW = im2bw(image); 

[BoundObj,imgLabel,Nobj,A] = bwboundaries(imageBW,'holes');
 
imageLabelRGB = label2rgb(imgLabel, @jet, [.7 .7 .7]);
imshow(imageLabelRGB); hold on;

for k = 1:length(BoundObj)
   boundary = BoundObj{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
hold off;
title('Etichette RGB + contorni');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
