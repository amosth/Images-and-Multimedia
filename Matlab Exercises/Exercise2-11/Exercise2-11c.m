%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.11 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Considerare la sequenza videoPersonal.X e ripetere le operazioni 
% effettuate al punto (b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

video = VideoReader('videoPersonal.mp4');
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

