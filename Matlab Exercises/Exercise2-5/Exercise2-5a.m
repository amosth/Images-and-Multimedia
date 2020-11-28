%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.5 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usando la procedura imtool() individuare una regione rettangolare dell?
% immagine che corrisponda al carattere ?e?. Ritagliare la sottoimmagine 
% corrispondente usando la procedura imcrop(). Visualizzare l?immagine 
% sorgente e l?immagine ritagliata.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.5 (a)','NumberTitle','off');

image = imread('text.png'); 
imageE = imcrop(image,[31 12 8 10]);

subplot(1,2,1), imshow(image), title('Immagine sorgente'); 
subplot(1,2,2), imshow(imageE), title('Immagine ritagliata');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%