%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.6 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Studiare la documentazione MATLAB sulla procedura bwboundaries() per 
% l?inseguimento di contorni (contour following) in immagini binarie;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.6 (b)','NumberTitle','off');

image = double(imread('phantX.gif')); 
subplot(1,2,1); 
imshow(image,'InitialMagnification', 'fit'), title('Immagine originale');
subplot(1,2,2);
imhist(image), grid, title('Istogramma - Imm. originale');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%