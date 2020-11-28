%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 2.6 (c)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Usando la bwboundaries() senza considerare le lacune (holes), ricavare 
% dall?immagine: Nobj, numero di oggetti; imgLabel, immagine delle 
% etichette; BoundObj, array con le posizioni dei pixel dei contorni
% degli oggetti; visualizzare Nobj e BoundObj;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure('Name','Esercizio 2.6 (c)','NumberTitle','off');

imageBW = im2bw(imread('phantX.gif'));

[B,L,Nobj,A] = bwboundaries(imageBW,'noholes'); 

imshow(imageBW), title('Immagine (bordi evidenziati in R)');
hold on;

% contorni
for k=1:length(B)
   boundary = B{k};
   if(k > Nobj)
    plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2); 
   else
    plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2); 
   end
end

disp(B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%