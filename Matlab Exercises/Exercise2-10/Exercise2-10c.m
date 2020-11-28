%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.10 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Acquisire con un dispositivo mobile (smartphone, tablet) una sequenza 
% video di 6-7 secondi, rispettando le seguenti condizioni: c1) La scena 
% reale deve contenere un singolo oggetto in moto relativo rigido rispetto 
% al dispositivo, che deve essere tenuto fermo; c2) durante l?acquisizione 
% non devono esserci apprezzabili variazioni di illuminazione: ad esempio, 
% si deve evitare di inquadrare una sorgente luminosa o lo schermo di un 
% computer;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.10 (b)','NumberTitle','off');

anteprima = read(VideoReader('videoCappellaro.mp4'), 1);
subplot(1,1,1), imshow(anteprima), title('Anteprima video acquisito'); 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

