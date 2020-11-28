%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.7 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usando la procedura regionprops() e la matrice delle etichette che si era
% ricavata al punto (b), estrarre le caratteristiche geometriche (features)
% 'Perimeter', 'Area' di ciascuna regione. I valori di perimetri e aree 
% devono essere presentati in una tabella usando la uitable().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.7 (c)','NumberTitle','off');

image = imread('geomTest.png');
image = rgb2gray(image);
imageBW = im2bw(image); 

[BoundObj,imgLabel,Nobj,A] = bwboundaries(imageBW,'holes');

props = regionprops(imgLabel, 'Centroid', 'Perimeter', 'Area');
perimeters = cat(1,props.Perimeter);
areas = cat(1,props.Area);

uit = uitable();
uit.Data = [perimeters, areas];
uit.ColumnName = {'Perimetro','Area'};
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
