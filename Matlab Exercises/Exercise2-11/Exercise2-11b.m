%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.11 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Implementare l?algoritmo di segmentazione del moto (Lezione 2.4, par.3).
% In particolare: in un ciclo sui frame, calcolare il valore assoluto delle
% differenze pixel per pixel tra due frame consecutivi; binarizzare le 
% immagini così ottenute, usando un valore di soglia threshDiff=0.3. 
% Visualizzare la sequenza delle differenze prima e dopo la sogliatura.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

video = VideoReader('traffic.mp4');
info = get(video);
frames = video.NumberOfFrames;

disp('Frames: ');
disp(frames);

threshold = 0.5;
frameBW = imbinarize(frameGray,threshold);

frames1 = frames - 1;
differenza = zeros([size(frame35,1),size(frame35,2), 1, frames1], class(frameBW));

threshDiff=0.3;

for k = 2:frames
    current = read(video,k);
    previous = read(video,k-1);
    absDifferenza = rgb2gray(abs(current - previous));
    differenza(:,:,:,k-1) = imbinarize(absDifferenza,threshDiff);
end

implay(differenza);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

