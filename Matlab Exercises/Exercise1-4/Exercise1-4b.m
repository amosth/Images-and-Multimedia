%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESERCIZIO: 1.4 (b)
% AUTORE:    Amos Cappellaro
% MATRICOLA: 134059
%
% Selezionare gli otto piani di bit usando la procedura MATLAB bitget().
% Visualizzare gli otto piani di bit.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Esercizio 1.4 (b)','NumberTitle','off');

image = imread('cameraman.tif');

img_out = zeros(size(image),'like',0);
img_out = bitset(img_out,8,a{8});
subplot(3,5,1), imshow(uint8(img_out)), title('Bit: 8');
for i = 7:8
    img_out = bitset(img_out,i,a{i});
end
subplot(3,5,2), imshow(uint8(img_out)), title('Bit: 7-8');
for i = 6:8
    img_out = bitset(img_out,i,a{i});
end
subplot(3,5,3), imshow(uint8(img_out)), title('Bit: 6-7-8');
for i = 5:8
    img_out = bitset(img_out,i,a{i});
end
subplot(3,5,4), imshow(uint8(img_out)), title('Bit: 5-6-7-8');
for i = 4:8
    img_out = bitset(img_out,i,a{i});
end
subplot(3,5,5), imshow(uint8(img_out)), title('Bit: 4-5-6-7-8');

subplot(3,5,6:15), imshow(image), title('Immagine originale');