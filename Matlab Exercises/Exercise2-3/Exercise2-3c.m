%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.3 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Effettuare tre filtraggi LoG dell?immagine ?mri.tif?, usando la edge() 
% rispettivamente con il parametro sigma = 0.5 ; 2 ; 3 della gaussiana. 
% Riportare le osservazioni nelle conclusioni.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.3 (c)','NumberTitle','off');

image = imread('mri.tif');
imageEdge05 = edge(image,'log',[],0.5);
imageEdge2 = edge(image,'log',[],2);
imageEdge3 = edge(image,'log',[],3);

subplot(1,4,1), imshow(image), title('Immagine originale');
subplot(1,4,2), imshow(imageEdge05), title('Immagine LoG (sigma = 0.5)');
subplot(1,4,3), imshow(imageEdge2), title('Immagine LoG (sigma = 2)');
subplot(1,4,4), imshow(imageEdge3), title('Immagine LoG (sigma = 3)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Con il diminuire di sigma, diminuisce la 'tolleranza' tra i diversi
% valori di grigio; ciò provoca dunque la rappresentazione di troppi edge.
% Con l'aumentare di sigma, invece, vengono tracciati gli edge più
% significativi.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%