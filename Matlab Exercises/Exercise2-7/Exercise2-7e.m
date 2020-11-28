%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.7 (e)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Per ogni oggetto calcolare il fattore di forma di circolarità (roundness 
% factor). Individuare gli oggetti che più si avvicinano ad una forma 
% circolare. Visualizzare l'immagine RGB coi contorni sovrapposti (punto 
% (b)) a cui siano ulteriormente sovrapposti i valori di roundness.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.7 (e)','NumberTitle','off');

threshold = 0.9;

image = imread('geomTest.png');
image = rgb2gray(image);
imageBW = im2bw(image); 

[BoundObj,imgLabel,Nobj,A] = bwboundaries(imageBW,'holes');
imageLabelRGB = label2rgb(imgLabel, @jet, [.7 .7 .7]);
imshow(imgLabelRGB), title('Etichette RGB + circolarità');
 
hold on
for k=1:length(BoundObj)
    boundary = BoundObj{k};
    
    %   Obtain the perimeter and area correspondig to label 'k'
    perimeter = geomPar(k).Perimeter;
    area = geomPar(k).Area;
    %   Compute the roundness matric of object 'k'
    metric = 4*pi*area/perimeter^2;
    %   Prepare display of results
    metric_string = sprintf('%2.2f',metric);
    %   Mark object above the threshold with a black circle
    if metric > threshold
        centroid = geomPar(k).Centroid;
        plot(centroid(1),centroid(2),'ko');
    end
    text(boundary(1,2)-40,boundary(1,1)+13,metric_string,'Color','g','FontSize',10,'FontWeight','bold');       
end
hold off;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


