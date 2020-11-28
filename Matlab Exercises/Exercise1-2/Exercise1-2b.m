%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.2 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Visualizzare i singoli canali H, S, V in livelli di grigio, assieme ai 
% rispettivi istogrammi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.2 (b)','NumberTitle','off');

peppers_rgb = imread('peppers.png');
peppers_hsv = rgb2hsv(peppers_rgb);

H = peppers_hsv(:,:,1);
S = peppers_hsv(:,:,2);
V = peppers_hsv(:,:,3);

subplot(3,2,1), imshow(H), title('Immagine (ch. H)'); 
subplot(3,2,2), imhist(H), grid, title('Istogramma - Imm. (ch. H)');

subplot(3,2,3), imshow(S), title('Immagine (ch. S)'); 
subplot(3,2,4), imhist(S), grid, title('Istogramma - Imm. (ch. S)');

subplot(3,2,5), imshow(V), title('Immagine (ch. V)'); 
subplot(3,2,6), imhist(V), grid, title('Istogramma - Imm. (ch. V)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%