%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.9 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% All?ultima immagine applicare la procedura MATLAB bwconncomp() per l?
% analisi di componenti connesse. Visualizzare, usando la fprintf(), i 
% risultati dell?analisi compiuta dalla bwconncomp(). In particolare: 
% la connettività; la risoluzione dell?immagine; il numero di oggetti 
% individuati; la dimensione dell?array di celle contenenti i pixel 
% appartenenti a ciascun oggetto.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

image = imread('circlesBrightDark.png'); 
imageInv = imcomplement(image);
imageBin = imbinarize(imageInv);

componenti = bwconncomp(imageBin);
disp(componenti);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

