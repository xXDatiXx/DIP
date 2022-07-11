%% Edges Frecuencia

clearvars;
clc;
close all;


%%
im = rgb2gray(imread('sarahacerca.jpeg'));
figure(); imshow(im); title('Imagen Original')

%Obteniendo FFT en versión shift
imFFT = fft2(im);
imFFTShift = fftshift(imFFT);

%Para visualización
imFFT_SLA = (log(abs(imFFTShift)));
figure(); imshow(imFFT_SLA,[]); title('Espectro de Fourier Shift-Log-abs')


%% crear kernel
[filas,cols] = size(im);

kernelGrande = zeros(size(im));

kernelEdges = [0 1 0; 1 -4 1; 0 1 0];

kernelGrande(round(filas/2) -1 : round(filas/2)+1, round(cols/2) -1: round(cols/2) +1) = kernelEdges;

kernelDef = fftshift(fft2(kernelGrande));


%% multiplicacion para edges

result = imFFTShift .* kernelDef;

invResult = ifftshift(result);
resultresult = abs(ifft2(invResult));
resultresultresult = ifftshift(resultresult);
figure(); imshow(resultresultresult, []);

