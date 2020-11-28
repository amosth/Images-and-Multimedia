%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.1
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Con riferimento alla Lezione 1.3 svolgere alcune fasi della 
% visualizzazione e dell?analisi esplorativa di immagini statiche. 
% Realizzare uno script MATLAB per ciascuno dei seguenti compiti:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parte (a)
%
% Visualizzare l'immagine 'cameraman.tif'; i metadati; la sua look-up table
% (LUT); l'istogramma dei livelli di grigio.

figure('Name','Esercizio 1.1 (a)','NumberTitle','off');

cameraman = imread('cameraman.tif');
% visualizzazione immagine
subplot(1,2,1), imshow(cameraman), colorbar
subplot(1,2,2), imhist(cameraman), grid 
% metadati immagine
metaCameraman = imfinfo('cameraman.tif')


%LUT = uint16(repmat([0 150 255 4095],1,64));
%cameramanLUT = LUT(cameraman+1);
%subplot(1,3,2);
%imshow(cameramanLUT,'InitialMagnification','fit');
%title('Immagine LUT');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte (b)
%
% Visualizzare l'immagine 'peppers.png'; i metadati.

figure('Name','Esercizio 1.1 (b)','NumberTitle','off');

peppers = imread('peppers.png');
% visualizzazione immagine
subplot(1,1,1), 
imshow(peppers,'InitialMagnification','fit');
% metadati immagine
metaPeppers = imfinfo('peppers.png')
title('Immagine Peppers');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte (c)
%
% Considerare l'immagine 'peppers.png'. Visualizzare ciascuna componente di
% colore R, G, B in forma di immagine a livelli di grigio (intensità) e il 
% relativo istogramma dei livelli di intensità.

figure('Name','Esercizio 1.1 (c)','NumberTitle','off');

% definizione delle variabili con i canali separati
peppers = imread('peppers.png');
peppersR = peppers(:,:,1);
peppersG = peppers(:,:,2);
peppersB = peppers(:,:,3);

% immagine originale + istogramma
subplot(2,4,1);
imshow(peppers);
title('Immagine originale');
subplot(2,4,2);
imhist(peppers), grid
title('Istogramma - Imm. originale');
% componente rossa + istogramma
subplot(2,4,3);
imshow(peppersR);
title('Componente rossa');
subplot(2,4,4);
imhist(peppersR), grid
title('Istogramma - Comp. rossa');
% componente verde + istogramma
subplot(2,4,5);
imshow(peppersG);
title('Componente verde');
subplot(2,4,6);
imhist(peppersG), grid
title('Istogramma - Comp. verde');
% componente blu + istogramma
subplot(2,4,7);
imshow(peppersB);
title('Componente blu');
subplot(2,4,8);
imhist(peppersB), grid
title('Istogramma - Comp. blu');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte (d)
%
% Per la stessa immagine ?peppers.png?: visualizzare ciascuna componente di
% colore R,G,B in forma di immagine a colori e il relativo istogramma dei 
% livelli di intensità.

figure('Name','Esercizio 1.1 (d)','NumberTitle','off');

peppers = imread('peppers.png');

peppersR = peppers;
peppersR(:,:,2) = 0;
peppersR(:,:,3) = 0;

peppersG = peppers;
peppersG(:,:,1) = 0;
peppersG(:,:,3) = 0;

peppersB = peppers;
peppersB(:,:,1) = 0;
peppersB(:,:,2) = 0;
% immagine originale + istogramma
subplot(2,4,1);
imshow(peppers);
title('Immagine originale');
subplot(2,4,2);
imhist(peppers), grid
title('Istogramma - Imm. originale');
% componente rossa + istogramma
subplot(2,4,3);
imshow(peppersR);
title('Componente rossa');
subplot(2,4,4);
imhist(peppersR), grid
title('Istogramma - Comp. rossa');
% componente verde + istogramma
subplot(2,4,5);
imshow(peppersG);
title('Componente verde');
subplot(2,4,6);
imhist(peppersG), grid
title('Istogramma - Comp. verde');
% componente blu + istogramma
subplot(2,4,7);
imshow(peppersB);
title('Componente blu');
subplot(2,4,8);
imhist(peppersB), grid
title('Istogramma - Comp. blu');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
