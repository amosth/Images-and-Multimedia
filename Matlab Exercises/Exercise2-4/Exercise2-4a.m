%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.4 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Definire un'immagine sintetica binaria costituita da soli tre punti 
% bianchi isolati. Applicare rumore gaussiano additivo a media nulla e 
% varianza 0.01. Applicare un filtro derivativo di Laplace alla sola 
% immagine col rumore, per ottenere la mappa delle ampiezze di edge 
% candidati. Usare fspecial() con parametro alpha di default e imfilter(). 
% Visualizzare le due immagini iniziali senza e con rumore; nella stessa 
% finestra visualizzare la mappa di ampiezze col rumore, anche in modalità
% grafica 3D usando la procedura mesh().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.4 (a)','NumberTitle','off');
 
image = zeros(30,30); 
image(12:13, 4:5)=1.;
image(20:20, 20:20)=1.; 
image(2:2, 27:28)=1.; 
 
subplot(2,2,1), imshow(image,'InitialMagnification','fit');
title('Imm. sintetica originale');
 
noise = imnoise(image,'gaussian',0,0.01);
 
subplot(2,2,2), imshow(noise,'InitialMagnification','fit'), title('Imm. con rumore (varianza = 0.01)');
 
maschera1 = fspecial('laplacian',0.2);
maschera2 = transpose(maschera1);
imageDXS = imfilter(noise,maschera1);
imageDYS = imfilter(noise,maschera2);
immAmpS = imageDXS + imageDYS;
 
subplot(2,2,3), imshow(immAmpS,'InitialMagnification','fit'), title('Imm. con rumore filtrata');
 
subplot(2,2,4), mesh(immAmpS), title('Modalità 3D (mappa delle ampiezze)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%