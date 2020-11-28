%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.6
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Operando con un dispositivo mobile o desktop, acquisire due foto (frame) 
% della stessa identica scena in due istanti successivi, molto vicini uno 
% all'altro. La scena deve essere statica, cioè senza oggetti in moto 
% relativo rispetto alla fotocamera. Usando le procedure MATLAB:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Parte a)
%
% Visualizzare le due immagini (frame). Di una delle due riportare i 
% metadati

frame1 = imread('spacex1.jpg');
frame2 = imread('spacex2.jpg');
 
% visualizzazione frames
figure('Name','Esercizio 1.6 (a)','NumberTitle','off');
subplot(2,1,1);
imshow(frame1,'InitialMagnification','fit'), title('Frame 1');
subplot(2,1,2);
imshow(frame2,'InitialMagnification','fit'), title('Frame 2');

% metadati frame1
metaFrame1 = imfinfo('spacex1.jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte b)
% 
% Convertire i due frame in immagini di intensità. Visualizzare le due 
% immagini di intensità ciascuna col proprio istogramma;

% conversione a livelli di grigio
frame1gray = rgb2gray(frame1);
frame2gray = rgb2gray(frame2);
 
% visualizzazione frame1gray + istogramma
figure('Name','Esercizio 1.6 (b)','NumberTitle','off');
subplot(2,2,1);
imshow(frame1gray,'InitialMagnification','fit');
title('Frame 1');
subplot(2,2,2);
imhist(frame1gray), grid;
title('Istogramma - Frame 1');
 
% visualizzazione frame2gray + istogramma
subplot(2,2,3);
imshow(frame2gray,'InitialMagnification','fit');
title('Frame 2');
subplot(2,2,4);
imhist(frame2gray), grid;
title('Istogramma - Frame 2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte c)
% 
% Calcolare la differenza pixel per pixel tra le due immagini di intensità,
% dopo aver convertito queste ultime in formato double. Visualizzare 
% l'immagine-differenza, considerando il fatto che in essa i valori dei 
% pixel possono essere negativi. Visualizzare l'istogramma dell'immagine 
% differenza usando la procedura histogram()

% differenza pixel tra frame1gray e frame2gray
differenza = double(frame1gray) - double(frame2gray);
 
figure('Name','Esercizio 1.6 (c)','NumberTitle','off'), subplot(1,2,1);
imshow(differenza);
title('Differenza');
subplot(1,2,2);
histogram(differenza);
title('Istogramma - Differenza');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

