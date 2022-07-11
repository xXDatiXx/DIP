clearvars;
clc;
close all;
%%
im = rgb2gray(imread('mau.jpg'));
figure(); imshow(im); title('Imagen Original')

%Obteniendo FFT en versión shift
imFFT = fft2(im);
imFFTShift = fftshift(imFFT);

%Para visualización
imFFT_SLA = (log(abs(imFFTShift)));
figure(); imshow(imFFT_SLA,[]); title('Espectro de Fourier Shift-Log-abs')
[filas,cols] = size(imFFTShift);

%% Creando el filtro promedio y transformandolo al dominio de la frecuencia
promedioKernel1 = ones(3)/(3 * 3); %Kernel promedio 3x3
fftPromedio1 = fft2(promedioKernel1, filas, cols); 
promedioShift = fftshift(fftPromedio1);

promedioKernel2 = ones(5)/(5 * 5); %Kernel promedio 5x5
fftPromedio2 = fft2(promedioKernel2, filas, cols);
prmedioShift2 = fftshift(fftPromedio2);

promedioKernel3 = ones(9)/(9 * 9); %Kernel promedio 9x9
fftPromedio3 = fft2(promedioKernel3, filas, cols);
prmedioShift3 = fftshift(fftPromedio3);

figure(); imshow(log(abs(promedioShift)),[]); title('Espectro de Fourier del filtro promedio')
figure(); surf(abs(promedioShift),'edgecolor','none'); 

%% Aplicando ambas máscaras al espectro de Fourier FFT-Shift

filtPomedioFFTIm = imFFTShift .* promedioShift; %Una convolución en el espacio es una multiplicación en la frecuencia

filtPomedioFFTIm2 = imFFTShift .* prmedioShift2;

filtPomedioFFTIm3 = imFFTShift .* prmedioShift3;

figure(); imshow(log(abs(filtPomedioFFTIm)),[]); title('Resultado del Filtro promedio en la frecuencia 3x3')
figure(); imshow(log(abs(filtPomedioFFTIm2)),[]); title('Resultado del Filtro promedio en la frecuencia 5x5')
figure(); imshow(log(abs(filtPomedioFFTIm3)),[]); title('Resultado del Filtro promedio en la frecuencia 9x9')

%% Inversa de Fourier para regresar la imagen al espacio

% De la frecuencia al espacio
invImFFTShift = ifftshift(filtPomedioFFTIm); %Unshifting the FFT
invImFFT = abs(ifft2(invImFFTShift));
figure(); imshow(abs(invImFFT), []);  title('Imagen Filtrada 3x3')

invImFFTShift2 = ifftshift(filtPomedioFFTIm2); %Unshifting the FFT
invImFFT2 = abs(ifft2(invImFFTShift2));
figure(); imshow(abs(invImFFT2), []);  title('Imagen Filtrada 5x5')

invImFFTShift3 = ifftshift(filtPomedioFFTIm3); %Unshifting the FFT
invImFFT3 = abs(ifft2(invImFFTShift3));
figure(); imshow(abs(invImFFT3), []);  title('Imagen Filtrada 9x9')











