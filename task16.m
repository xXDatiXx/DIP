%Task 16
clearvars;
clc;
close all;

img=rgb2gray(imread('pic.jpg'));

noise(img);

function noise=noise(img);
imgGauss=imnoise(img,"gaussian");
imgSP=imnoise(img,'salt & pepper');
imgPoisson=imnoise(img,'poisson');
imgSpeckle=imnoise(img,'speckle');
figure("Name",'Noise');
subplot(2,2,1);imshow(imgGauss);title('Gaussian');
subplot(2,2,2);imshow(imgSP);title('Salt & Pepper');
subplot(2,2,3);imshow(imgPoisson);title('Posisson');
subplot(2,2,1);imshow(imgSpeckle);title('Speckle');

a=0;
gaussian(imgGauss,a);
a=1;
gaussian(imgSP,a);
gaussian(imgPoisson,a);
gaussian(imgSpeckle,a);

b=0;
pasaAB(imgGauss,b);
b=1;
pasaAB(imgSP,b);
pasaAB(imgPoisson,b);
pasaAB(imgSpeckle,b);

end

function gaussian=gaussian(img,a);
imEscalada =imresize(img,[512, 512]);

fftImagen = fft2(imEscalada);
imagenShift = fftshift(fftImagen);
%figure(); imshow(log(abs(imagenShift )),[]); title('Imagen en la Frecuencia FFT');

gf = fspecial('gaussian', 512,1); 
gf = mat2gray(gf); 
gf2 = fspecial('gaussian', 512,5); 
gf2 = mat2gray(gf2); 
if a==0;
figure('Name','Gausiana en el espacio');
subplot(1,2,1);imshow(log((gf)),[]);title('sigma=1');
subplot(1,2,2);imshow(log((gf2)),[]);title('sigma=5');
end

fftGaussiana = fft2(gf, 512, 512);
gaussianaShift = fftshift(fftGaussiana);
fftGaussiana2 = fft2(gf2, 512, 512);
gaussianaShift2 = fftshift(fftGaussiana2);
if a==0;
figure('Name','Del espacio a la frecuencia');
subplot(1,2,1);imshow(log(abs(gaussianaShift)),[]);title('Gaussiana Frecuencia 1');
subplot(1,2,2);imshow(log(abs(gaussianaShift2)),[]);title('Gaussiana Frecuencia 2');
end

imagenFiltrada = imagenShift .* gaussianaShift; %Aplicando el filtro a la imagen (ambos estan en la frecuencia)
imagenFiltrada2 = imagenShift .* gaussianaShift2;

imagenFiltradaEspacio = ifftshift(ifft2(imagenFiltrada));
imagenFiltradaEspacio2 = ifftshift(ifft2(imagenFiltrada2));
figure('Name','Aplicando el filtro a la imagen');
subplot(1,2,1);imshow(abs(imagenFiltradaEspacio),[]); title('Imagen Filtrada de regreso al espacio');
subplot(1,2,2);imshow(abs(imagenFiltradaEspacio2),[]); title('Imagen Filtrada de regreso al espacio');
end

function pasaAB=pasaAB(img,a);
imFFT = fft2(img);
imFFTShift = fftshift(imFFT);
imFFT_SLA = (log(abs(imFFTShift)));
figure(); imshow(imFFT_SLA,[]); title('Espectro de Fourier Shift-Log-abs')

[rows, cols] = size(imFFT);
cX =round(cols/2); 
cY = round(rows/2); 
radio = round(rows/4);
mask1 = zeros(rows, cols); 
m = {cY, cX}; 
mask1(m{:})= 1; 
mask1 = bwdist(mask1) <= radio;
mask2 = 1 - mask1;
if a==0;
figure('Name','Mascaras Ciruclares');
subplot(1,2,1);imshow(mask1);title('Maskara 1');
subplot(1,2,2);imshow(mask2);title('Maskara 2');
end

imFFTShift_mask1 = imFFTShift; 
imFFTShift_mask1(mask1 == 0) = 0;  
imFFTShift_mask2 = imFFTShift; 
imFFTShift_mask2(~mask2) = 0;
if a==0;
figure('Name','Aplicando Maskaras');
subplot(1,2,1);imshow(log(abs(imFFTShift_mask1)),[]); title('Bajas Frecuencia');
subplot(1,2,1);imshow(log(abs(imFFTShift_mask2)),[]); title('Altas Frecuencia');
end
% Procesando las frecuencias bajas
invImFFTShift = ifftshift(imFFTShift_mask1); 
invImFFT = abs(ifft2(invImFFTShift));
minBound = min(abs(invImFFT(:)));
maxBound = max(abs(invImFFT(:)));

% Procesando las frecuencias altas
invImFFTH= abs(ifft2(ifftshift(imFFTShift_mask2))); 


figure('Name','Procesando las frecuencias');
subplot(1,2,1);imshow(abs(invImFFT), [minBound maxBound]); title('Filtro Pasa bajas Frecuencias');
subplot(1,2,2);imshow(abs(invImFFTH), []);  title('Filtro Pasa Altas Frecuencias');

end

