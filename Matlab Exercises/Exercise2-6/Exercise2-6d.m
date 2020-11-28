%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.6 (d)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Visualizzare l?immagine delle etichette imgLabel in formato sorgente e in
% formato RGB; sovrapporre a questa i contorni degli oggetti dell?array 
% BoundObj calcolato al punto (c), e visualizzare questa immagine assieme 
% alle prime due nella stessa finestra;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 2.6 (d)','NumberTitle','off');

imageBW = im2bw(imread('phantX.gif'));

[B,imageLabel,Nobj,A] = bwboundaries(imageBW,'noholes'); 

subplot(1,3,1), imshow(imageLabel), title('Etichette originale');
subplot(1,3,2), imshow(label2rgb(imageLabel, @jet, [.5 .5 .5])), hold on;

for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2) 
end
title('Etichette RGB');

subplot(1,3,3), imshow(imageBW); hold on;
colors=['g' 'c' 'r' 'c' 'm' 'y'];

for k=1:length(B)
   boundary = B{k};
   cidx = mod(k,length(colors))+1; plot(boundary(:,2), boundary(:,1),...
       colors(cidx),'LineWidth',2);
   
   %randomize text position for better visibility
   rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
   col = boundary(rndRow,2); row = boundary(rndRow,1);
   h = text(col+1, row-1, num2str(imageLabel(row,col))); 
   set(h,'Color',colors(cidx),'FontSize',14,'FontWeight','bold');
end

title('Etichette contorni');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%