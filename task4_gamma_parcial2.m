clc; 
clearvars; 
clear all;

img = imread('mau.jpg');
gray = double(rgb2gray(img));

figure("Name","Resultados");
subplot(2,3,1); imshow(img); title('original');
subplot(2,3,2); imshow(gray,[]); title('gray');
hold on;

nolineal1 = ((gray/255).^(1/1.8))*(255);
nolineal2 = ((gray/255).^(1/0.55))*(255);
nolineal3 = ((gray/255).^(1/0.25))*(255);

subplot(2,3,3); imshow(nolineal1,[]); title('gamma 1.8');
subplot(2,3,4); imshow(nolineal2,[]); title('gamma 0.55');
subplot(2,3,5); imshow(nolineal3,[]); title('gamma 0.25');

%% Gamma a rgb

R = double(img(:,:,1));
G = double(img(:,:,2));
B = double(img(:,:,3));

R1 = ((R/255).^(1/1.8))*(255);
G1 = ((G/255).^(1/1.8))*(255);
B1 = ((B/255).^(1/1.8))*(255);
result = cat(3,R1,G1,B1);

R2 = ((R/255).^(1/0.55))*(255);
G2 = ((G/255).^(1/0.55))*(255);
B2 = ((B/255).^(1/0.55))*(255);
result2 = cat(3,R2,G2,B2);

R3 = ((R/255).^(1/0.25))*(255);
G3 = ((G/255).^(1/0.25))*(255);
B3 = ((B/255).^(1/0.25))*(255);
result3 = cat(3,R3,G3,B3);

figure('Name','RGB_gamma')
subplot(2,2,1); imshow(result,[]); title('Gamma 1.8');
subplot(2,2,2); imshow(result2,[]); title('Gamma 0.55');
subplot(2,2,3); imshow(result3,[]); title('Gamma 0.25');