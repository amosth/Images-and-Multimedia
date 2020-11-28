%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.10 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Riprodurre la sequenza con implay() e visualizzare i metadati. Estrarre 
% la durata in secondi e il numero di frame che compongono la sequenza;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

implay('viplanedeparture.mp4');
video = VideoReader('viplanedeparture.mp4'); 
info = get(video);
disp(info);

durata = info.Duration;
disp('Durata (s): ');
disp(durata);

frames = video.NumberOfFrames;
disp('Frames: ');
disp(frames);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

