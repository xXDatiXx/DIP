%task 15 
clearvars;
close all;
clc;

%% Convertir imagen a la frecuencia
%Aplicando el filtro gaussiano a la imagen
im = rgb2gray(imread('pic.jpg'));
imEscalada =imresize(im,[512, 512]);

fftImagen = fft2(imEscalada);
imagenShift = fftshift(fftImagen);
figure(); imshow(log(abs(imagenShift )),[]); title('Imagen en la Frecuencia FFT');

%% Crear Kernel Gaussiano y convertirlo a la frecuencia

%Gaussiana en el espacio
sigma  = 5;
gf = fspecial('gaussian', 512,1); %sigma = 5
gf = mat2gray(gf); %Para escalar gf a 1
figure(); imshow(log((gf)),[]); title('Gaussiana sigma 1');

gf2 = fspecial('gaussian', 512,3); %sigma = 5
gf2 = mat2gray(gf2); %Para escalar gf a 1
figure(); imshow(log((gf2)),[]); title('Gaussiana sigma 2');

gf3 = fspecial('gaussian', 512,5); %sigma = 5
gf3 = mat2gray(gf3); %Para escalar gf a 1
figure(); imshow(log((gf3)),[]); title('Gaussiana sigma 3');


%Del espacio a la frecuencia
fftGaussiana = fft2(gf, 512, 512);
gaussianaShift = fftshift(fftGaussiana);
figure(); imshow(log(abs(gaussianaShift )),[]); title('Gaussiana en la Frecuencia1');

fftGaussiana2 = fft2(gf2, 512, 512);
gaussianaShift2 = fftshift(fftGaussiana2);
figure(); imshow(log(abs(gaussianaShift2 )),[]); title('Gaussiana en la Frecuencia2');

fftGaussiana3 = fft2(gf3, 512, 512);
gaussianaShift3 = fftshift(fftGaussiana3);
figure(); imshow(log(abs(gaussianaShift3 )),[]); title('Gaussiana en la Frecuencia3');

imagenFiltrada = imagenShift .* gaussianaShift; %Aplicando el filtro a la imagen (ambos estan en la frecuencia)
imagenFiltrada2 = imagenShift .* gaussianaShift2;
imagenFiltrada3 = imagenShift .* gaussianaShift3;

imagenFiltradaEspacio = ifftshift(ifft2(imagenFiltrada));
figure(); imshow(abs(imagenFiltradaEspacio),[]); title('Imagen Filtrada de regreso al espacio');

imagenFiltradaEspacio2 = ifftshift(ifft2(imagenFiltrada2));
figure(); imshow(abs(imagenFiltradaEspacio2),[]); title('Imagen Filtrada de regreso al espacio');

imagenFiltradaEspacio3 = ifftshift(ifft2(imagenFiltrada3));
figure(); imshow(abs(imagenFiltradaEspacio3),[]); title('Imagen Filtrada de regreso al espacio');
