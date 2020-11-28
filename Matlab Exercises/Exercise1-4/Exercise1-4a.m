%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.4 (a)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Selezionare gli otto piani di bit usando la procedura MATLAB bitget().
% Visualizzare gli otto piani di bit.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.4 (a)','NumberTitle','off');

image = imread('cameraman.tif');

a = {};
a = cell(8,1);

for i = 1:8
    a{i} = bitget(image, i);
    subplot(2,4,i), imshow(logical(a{i})), title(sprintf('Piano %d',i));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
