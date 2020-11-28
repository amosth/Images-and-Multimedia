%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.8 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usare la regionprops() per la stima di caratteristiche geometriche delle 
% regioni individuate al passo (b): in particolare riportare le stime di 
% perimetri e aree delle regioni individuate tramite bwconncomp().
% Visualizzare l?immagine binaria con sovrapposti i centroidi delle regioni
% individuate.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.8 (c)','NumberTitle','off');

image = zeros(50,50);   % 50x50px neri
image(10:40, 10:16)=1.; % rettangolo di px bianchi 
image(41:45,  5:10)=1.; % rettangolo di px bianchi 
image(19:40, 20:30)=1.; % rettangolo di px bianchi 
image(41:45, 31:45)=1.; % rettangolo di px bianchi 
image(5:20,  35:45)=1.; % rettangolo di px bianchi

componenti = bwconncomp(image,4);
props = regionprops(componenti, 'Centroid', 'Perimeter', 'Area'); 
centroids = cat(1, props.Centroid);
areas = cat(1, props.Area);
perimeters = cat(1, props.Perimeter);

uit = uitable('Position',[20 20 470 250]);
uit.Data = [perimeters, areas, centroids(:,1), centroids(:,2)];
uit.ColumnName = {'Perimetro','Area','Centroide(x)','Centroide(y)'};

subplot(1,2,2), imshow(image,'InitialMagnification','fit');
title('Immagine sintetica + centroidi'); 
hold on
plot(centroids(:,1),centroids(:,2), 'r*')
hold off
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

