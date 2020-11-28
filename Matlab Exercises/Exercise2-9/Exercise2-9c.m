%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.9 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usare la regionprops() per la stima di caratteristiche geometriche 
% (geometric features) delle regioni individuate al passo (b): in 
% particolare riportare in una tabella uitable() le stime di perimetri, 
% aree, centroidi delle regioni individuate tramite bwconncomp(). 
% Visualizzare l?immagine binaria modificata come al punto (a), con 
% sovrapposti i centroidi delle regioni individuate.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.9 (c)','NumberTitle','off');

image = imread('circlesBrightDark.png'); 

imageInv = imcomplement(image);
imageBin = imbinarize(imageInv);

imageBin(80:160,60:200) = 1.;
imageBin(230:360,90:130) = 1.;
imageBin(430:460,40:210) = 1.;

componenti = bwconncomp(imageBin,4);
props = regionprops(componenti, 'Centroid', 'Perimeter', 'Area'); 
centroids = cat(1, props.Centroid);
areas = cat(1, props.Area);
perimeters = cat(1, props.Perimeter);
 
uit = uitable('Position',[40 50 335 195]);
uit.Data = [perimeters, areas, centroids(:,1), centroids(:,2)];
uit.ColumnName = {'Perimetro','Area','Centroide(x)','Centroide(y)'};
 
subplot(1,2,2), imshow(imageBin,'InitialMagnification','fit');
title('Immagine sintetica + centroidi'); 
hold on
plot(centroids(:,1),centroids(:,2), 'r*')
hold off
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

