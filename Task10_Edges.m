%% reset
clc;
clearvars;
close all;
%% Imagen


img1 = imread('mau.jpg');
img2 = imread("castilloExterior.jpg");
img3 = imread('Saraha_interior.jpeg');

derivadas(img1);
derivadas(img2);
derivadas(img3);



function derivadas = derivadas(im)
    figure("Name","Mau");
    im = rgb2gray(im);

    subplot(2,2,1); imshow(im); title("Original");
    filt1 = edge(im, 'sobel');

    k1 = [0,-1,0;-1,4,-1;0,-1,0];
    filt2 = imfilter(im, k1);

    k2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    filt3 = imfilter(im, k2);

    subplot(2,2,2); imshow(filt1); title('Sobel');
    subplot(2,2,3); imshow(filt2); title('1a derivada');
    subplot(2,2,4); imshow(filt3); title('2a derivada');

end



