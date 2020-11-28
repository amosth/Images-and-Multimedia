%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.3 (3)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Sempre a partire dall?immagine in livelli di grigio ottenuta al punto 1, 
% partizionarla in 16 bande. Visualizzare l?immagine risultante usando due 
% colormap, la jet() e la hot().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.3 (3)','NumberTitle','off');

img = imread('westconcordaerial.png'); 
img_gray = rgb2gray(img);

% partizione in 16 bande
img16 = grayslice(img_gray, 16);
subplot(1,2,1), imshow(img16, jet(16)), colormap, title('Immagine 16 bande (jet())'); 
subplot(1,2,2), imshow(img16, hot(16)), colormap, title('Immagine 16 bande (hot())');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%