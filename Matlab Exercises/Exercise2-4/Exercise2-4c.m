%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.4 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Invertire l'immagine filtrata (negativo/positivo) ed eliminare i valori 
% negativi mediante sogliatura usando imbinarize(); visualizzare la nuova 
% immagine anche in modalità grafica.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.4 (c)','NumberTitle','off');
 
imageInv = 1-immAmpS;
imageInvBin = imbinarize(imageInv,0.2);
 
subplot(2,2,1), imshow(immAmpS, 'InitialMagnification', 'fit');
title('Imm. filtrata (+)');

subplot(2,2,2), imshow(imageInv, 'InitialMagnification', 'fit');
title('Imm. filtrata (-)');

subplot(2,2,3), imshow(imageInvBin, 'InitialMagnification', 'fit');
title('Imm. (-) binarizzata');

subplot(2,2,4), mesh(imageInvBin);
title('Imm. (-) binarizzata - Modalità grafica');
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
