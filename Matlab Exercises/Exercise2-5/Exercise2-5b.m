%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.5 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Calcolare la correlazione normalizzata tra le due immagini usando la 
% procedura normxcorr2(); visualizzare la correlazione rappresentandola 
% in livelli di grigio assieme al proprio istogramma, e in grafica 3d 
% tramite la procedura surf()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.5 (b)','NumberTitle','off');

image = imread('text.png'); 
imageE = imcrop(image,[31 12 8 10]);

normalizz = normxcorr2(imageE,image);
normalizz = mat2gray(normalizz);
subplot(1,3,1), imshow(normalizz), title('Correlazione normalizzata');
subplot(1,3,2), imhist(normalizz), title('Istogramma'); 
subplot(1,3,3), surf(normalizz), title('Grafica 3D'); 

shading flat;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%