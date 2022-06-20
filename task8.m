%Calidad
%% Calidad Promedio
img = rgb2gray(imread('mau.jpg'));
doubled = double(img);

kernel1 = ones(3)/9;
kernel2 = ones(5)/25;
kernel3 = ones(11)/121;


promedio1 = imfilter(doubled, kernel1);
promedio2 = imfilter(doubled, kernel2);
promedio3 = imfilter(doubled, kernel3);

figure(); imshow(promedio1, []); title('Promedio1');
figure(); imshow(promedio2, []); title('Promedio2');
figure(); imshow(promedio3, []); title('Promedio3');

%% Calidad Mediana
img = rgb2gray(imread('mau.jpg'));

mediana1 = medfilt2(img, [3,3]);
mediana2 = medfilt2(img, [5,5]);
mediana3 = medfilt2(img, [11,11]);

figure(); imshow(mediana1); title('mediana1');
figure(); imshow(mediana2); title('mediana2');
figure(); imshow(mediana3); title('mediana3');

%% Calidad Gaussiano
img = rgb2gray(imread('mau.jpg'));
doubled = double(img);

imG = imgaussfilt(doubled, 2, 'FilterSize', 5);
imG2 = imgaussfilt(doubled, 3, 'FilterSize', 7);
imG3 = imgaussfilt(doubled, 4, 'FilterSize', 9);

figure(); imshow(imG, []); title('Gauss1');
figure(); imshow(imG2, []); title('Gauss2');
figure(); imshow(imG3, []); title('Gauss3');

%% Baja Calidad Promedio
img = rgb2gray(imread('Lowq.jpeg'));
doubled = double(img);

kernel1 = ones(3)/9;
kernel2 = ones(5)/25;
kernel3 = ones(11)/121;


promedio1 = imfilter(doubled, kernel1);
promedio2 = imfilter(doubled, kernel2);
promedio3 = imfilter(doubled, kernel3);

figure(); imshow(promedio1, []); title('Promedio1');
figure(); imshow(promedio2, []); title('Promedio2');
figure(); imshow(promedio3, []); title('Promedio3');

%% Baja Calidad Mediana
img = rgb2gray(imread('Lowq.jpeg'));

mediana1 = medfilt2(img, [3,3]);
mediana2 = medfilt2(img, [5,5]);
mediana3 = medfilt2(img, [11,11]);

figure(); imshow(mediana1); title('mediana1');
figure(); imshow(mediana2); title('mediana2');
figure(); imshow(mediana3); title('mediana3');

%% Baja Calidad Gaussiano
img = rgb2gray(imread('Lowq.jpeg'));
doubled = double(img);

imG = imgaussfilt(doubled, 2, 'FilterSize', 5);
imG2 = imgaussfilt(doubled, 3, 'FilterSize', 7);
imG3 = imgaussfilt(doubled, 4, 'FilterSize', 9);

figure(); imshow(imG, []); title('Gauss1');
figure(); imshow(imG2, []); title('Gauss2');
figure(); imshow(imG3, []); title('Gauss3');
