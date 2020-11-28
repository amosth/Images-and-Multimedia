%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.9 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Visualizzare la stessa immagine con sovrapposti i centroidi delle sole 
% regioni di forma circolare.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.9 (d)','NumberTitle','off');

threshold = 0.9;
image = imread('circlesBrightDark.png'); 
imageInv = imcomplement(image);
imageBin = imbinarize(imageInv);
imageBin(80:160,60:200) = 1.;
imageBin(230:360,90:130) = 1.;
imageBin(430:460,40:210) = 1.;

BoundObj = componenti.PixelIdxList;
imshow(imageBin, 'InitialMagnification', 'fit');
title('Immagine sintetica + centroidi circolari');

componenti = bwconncomp(imageBin,4);
props = regionprops(componenti, 'Centroid', 'Perimeter', 'Area'); 

hold on
for k=1:length(BoundObj)
    boundary = BoundObj(k);
    perimeter = props(k).Perimeter;
    area = props(k).Area;
    metric = 4*pi*area/perimeter^2; metric_string = sprintf('%2.2f',metric);
    
    if metric > threshold
        centroid = props(k).Centroid; 
        plot(centroid(1),centroid(2),'ko');
    end
end
hold off;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

