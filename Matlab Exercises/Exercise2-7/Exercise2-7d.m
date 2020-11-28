%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.7 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Analogamente a quanto fatto al punto (c) estrarre i centroidi 
% ('Centroids'), e visualizzare l'immagine RGB delle etichette con 
% sovrapposti i centroidi degli oggetti.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.7 (d)','NumberTitle','off');

image = imread('geomTest.png');
image = rgb2gray(image);
imageBW = im2bw(image); 

[BoundObj,imgLabel,Nobj,A] = bwboundaries(imageBW,'holes');
imageLabelRGB = label2rgb(imgLabel, @jet, [.7 .7 .7]);

props = regionprops(imgLabel, 'Centroid', 'Perimeter', 'Area');
centroids = cat(1, props.Centroid);
imshow(imageLabelRGB, 'InitialMagnification', 'fit');
title('Etichette RGB + centroidi');
hold on
plot(centroids(:,1),centroids(:,2), 'k*')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

