%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.10 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Chiamare la sequenza acquisita videoPersonal.X Effettuare l?analisi 
% esplorativa della sequenza secondo le consegne riportate nei punti (a), 
% (b) precedenti.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
implay('videoPersonal.mp4');
video = VideoReader('videoPersonal.mp4'); 
info = get(video);
disp(info);

durata = info.Duration;
disp('Durata (s): ');
disp(durata);

frames = video.NumberOfFrames;
disp('Frames: ');
disp(frames);

figure('Name','Esercizio 2.10 (d)','NumberTitle','off');

frame50 = read(video, 50);  
frame50g = rgb2gray(frame50); 

threshEx = 0.4;
frameBW = imbinarize(frame50g,threshEx); 

subplot(3,2,1), imshow(frame50), title('Frame n.50'); 
subplot(3,2,2), histogram(frame50), grid, title('Istogramma - Fr.50');
subplot(3,2,3), imshow(frame50g), title('Frame n.50 gray'); 
subplot(3,2,4), histogram(frame50g), grid, title('Istogramma - Fr.50 gray');
subplot(3,2,5), imshow(frameBW), title('Frame n.50 binarizzato'); 
subplot(3,2,6), histogram(frameBW), grid, title('Istogramma - Fr.50 binarizzato');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

