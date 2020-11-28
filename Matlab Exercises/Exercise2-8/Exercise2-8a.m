%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.8 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Visualizzare: l?immagine originale e il suo istogramma;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.8 (a)','NumberTitle','off');

image = zeros(50,50);   % 50x50px neri
image(10:40, 10:16)=1.; % rettangolo di px bianchi 
image(41:45,  5:10)=1.; % rettangolo di px bianchi 
image(19:40, 20:30)=1.; % rettangolo di px bianchi 
image(41:45, 31:45)=1.; % rettangolo di px bianchi 
image(5:20,  35:45)=1.; % rettangolo di px bianchi
 
subplot(1,2,1), imshow(image), title('Immagine sintetica'); 
subplot(1,2,2), histogram(image), title('Istogramma - Imm. sintetica');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

