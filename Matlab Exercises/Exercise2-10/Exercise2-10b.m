%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.10 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Estrarre il frame n.50. Visualizzare il frame; lo stesso convertito in 
% livelli di grigio; lo stesso binarizzato. Associare l?istogramma a 
% ciascuna delle tre immagini.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.10 (b)','NumberTitle','off');

video = VideoReader('viplanedeparture.mp4'); 
frame50 = read(video, 50); % frameX è ovviamente un immagine statica 
frame50g = rgb2gray(frame50); % Frame format converted to grayscale

threshEx = 0.4;
frameBW = imbinarize(frame50g,threshEx); % Frame binarized

subplot(3,2,1), imshow(frame50), title('Frame n.50'); 
subplot(3,2,2), histogram(frame50), grid, title('Istogramma - Fr.50');
subplot(3,2,3), imshow(frame50g), title('Frame n.50 gray'); 
subplot(3,2,4), histogram(frame50g), grid, title('Istogramma - Fr.50 gray');
subplot(3,2,5), imshow(frameBW), title('Frame n.50 binarizzato'); 
subplot(3,2,6), histogram(frameBW), grid, title('Istogramma - Fr.50 binarizzato');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

