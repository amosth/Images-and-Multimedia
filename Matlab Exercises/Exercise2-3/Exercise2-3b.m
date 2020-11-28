%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.3 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Stimare la precisione delle mappe di ampiezze di Sobel calcolate al punto
% (a), usando il MSE. Assumere come riferimento l?immagine sorgente. 
% Riportare i risultati usando la uitable(), e verbalmente nelle 
% conclusioni.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.3 (b)','NumberTitle','off');

image = imread('blobs.png');
imageEdge = edge(image,'Sobel');

% Sobel
maschera1 = fspecial('sobel');
maschera2 = transpose(maschera1);
imageDXS = imfilter(image,maschera1);
imageDYS = imfilter(image,maschera2);
imageAmpS = abs(imageDXS) + abs(imageDYS); 
imageAmpS9 = im2bw(imageAmpS,0.9);
imageMse1 = immse(double(imageEdge), double(image)); 
imageMse2 = immse(double(imageAmpS9), double(image));
data = {imageMse1; imageMse2};
uit = uitable();
uit.ColumnName = {'MSE'};
uit.RowName = {'con edge()', 'senza edge()'}; 
uit.Data = data;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% L'MSE con procedura edge() è maggiore di quasi un centesimo rispetto all'
% MSE calcolato senza procedura edge()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

msgbox('L''MSE con procedura edge() è maggiore di quasi un centesimo rispetto all''MSE calcolato senza procedura edge()');