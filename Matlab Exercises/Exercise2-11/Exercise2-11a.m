%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.11 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Considerare la sequenza traffic.avi Estrarre il frame n.35 e 
% visualizzarlo; visualizzare lo stesso convertito in livelli di grigio; lo
% stesso binarizzato con soglia thresh=0.5. Associare l?istogramma a 
% ciascuna delle tre immagini;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.11 (a)','NumberTitle','off');

video = VideoReader('traffic.mp4');
info = get(video);
frames = video.NumberOfFrames;

frame35 = read(video, 35); 
frameGray = rgb2gray(frame35);

threshEx = 0.5;
frameBW = imbinarize(frameGray,threshEx);

subplot(3,2,1), imshow(frame35), title('Frame 35 della sequenza'); 
subplot(3,2,2), histogram(frame35), grid, title('Istogramma - Fr.35');
subplot(3,2,3), imshow(frameGray), title('Frame 35 a livelli di grigio'); 
subplot(3,2,4), histogram(frameGray), grid, title('Istogramma - Fr.35 gray');
subplot(3,2,5), imshow(frameBW), title('Frame 35 binarizzato'); 
subplot(3,2,6), histogram(frameBW), grid, title('Istogramma - Fr.35 binarizzato');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

