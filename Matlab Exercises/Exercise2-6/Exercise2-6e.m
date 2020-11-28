%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.6 (e)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Ripetere i passi al punto (c) e (d) considerando anche le lacune.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.6 (e)','NumberTitle','off');

imageBW = im2bw(imread('phantX.gif')); 

[B,imageLabel,Nobj,A] = bwboundaries(imageBW,'holes'); 

subplot(1,3,1), imshow(imageLabel), title('Etichette originale');
subplot(1,3,2), imshow(label2rgb(imageLabel, @jet, [.5 .5 .5])), hold on;

for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2) 
end
title('Etichette RGB');

subplot(1,3,3), imshow(image), hold on; 
colors=['g' 'c' 'r' 'c' 'm' 'y'];

for k=1:length(B),
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