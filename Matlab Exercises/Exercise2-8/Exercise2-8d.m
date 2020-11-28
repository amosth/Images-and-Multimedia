%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.8 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Ripetere i passi (b) e (c) effettuando l?analisi delle componenti 
% 8-connesse.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.8 (d)','NumberTitle','off');

image = zeros(50,50);   % 50x50px neri
image(10:40, 10:16)=1.; % rettangolo di px bianchi 
image(41:45,  5:10)=1.; % rettangolo di px bianchi 
image(19:40, 20:30)=1.; % rettangolo di px bianchi 
image(41:45, 31:45)=1.; % rettangolo di px bianchi 
image(5:20,  35:45)=1.; % rettangolo di px bianchi

componenti8 = bwconncomp(img,8);
props8 = regionprops(componenti8, 'Centroid', 'Perimeter', 'Area'); 
centroids8 = cat(1, props8.Centroid);
areas8 = cat(1, props8.Area);
perimeters8 = cat(1, props8.Perimeter);

uit8 = uitable('Position',[20 20 470 250]);
uit8.Data = [perimeters8, areas8, centroids8(:,1), centroids8(:,2)]; 
uit8.ColumnName = {'Perimetro','Area','Centroide(x)','Centroide(y)'};

subplot(1,2,2), imshow(image,'InitialMagnification','fit');
title('Immagine sintetica + centroidi (comp. 8)');
hold on
plot(centroids8(:,1),centroids8(:,2), 'r*')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

