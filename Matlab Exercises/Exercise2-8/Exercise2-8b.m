%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.8 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Applicare la procedura MATLAB bwconncomp() per l?analisi di componenti 
% 4-connesse. Visualizzare i risultati dell?analisi compiuta dalla 
% bwconncomp().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

image = zeros(50,50);   % 50x50px neri
image(10:40, 10:16)=1.; % rettangolo di px bianchi 
image(41:45,  5:10)=1.; % rettangolo di px bianchi 
image(19:40, 20:30)=1.; % rettangolo di px bianchi 
image(41:45, 31:45)=1.; % rettangolo di px bianchi 
image(5:20,  35:45)=1.; % rettangolo di px bianchi

componenti = bwconncomp(image,4);
disp(componenti);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

