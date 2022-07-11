%% Task 13

%% Imagen 1
clc;
clearvars;
close all;

img1 = rgb2gray(double(imread('mau.jpg')));
img2 = rgb2gray(double(imread('Saraha_interior.jpeg')));
img3 = rgb2gray(double(imread('puppybueno.jpg')));
imgF1 = abs(fft2(img1));
imgF2 = abs(fft2(img2));
imgF3 = abs(fft2(img3));


figure(); histogram(imgF1); title("Mau");
figure(); histogram(imgF2); title("Saraha");
figure(); histogram(imgF3); title("puppybueno");

imgF1log= log(imgF1);
imgF2log= log(imgF2);
imgF3log= log(imgF3);

max(imgF1);
min(imgF1);

shifted1 = fftshift(imgF1log);
shifted2 = fftshift(imgF2log);
shifted3 = fftshift(imgF3log);

figure(); imshow(uint8(shifted1), []); title("Espectro mau")
figure(); imshow(uint8(shifted2), []); title("Espectro sraha")
figure(); imshow(uint8(shifted3), []); title("Espectro puppy")

figure(); imshow(uint(ifft2(shifted1)), []); title("Inverso mau")
figure(); imshow(uint(ifft2(shifted2)), []); title("Inverso sraha")
figure(); imshow(uint(ifft2(shifted3)), []); title("Inverso puppy")



