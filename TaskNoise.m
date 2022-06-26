%Gauss Noise
img = rgb2gray(imread('mau.jpg'));

imGauss= imnoise(img,"gaussian");
figure(); imshow(imGauss); title('GaussO');
k = ones(5)/25;
imGaussProm = imfilter(double(imGauss), k);
figure(); imshow(imGaussProm, []); title('GaussPromedio');
imGaussMed = medfilt2(imGauss, [5,5]);
figure(); imshow(imGaussMed); title('GaussMediana');
imGaussGauss = imgaussfilt(double(imGauss), 3, "FilterSize", 5);
figure(); imshow(imGaussGauss, []); title('GaussGauss');


%% Salt & Pepper noise
img = rgb2gray(imread('mau.jpg'));
imSP= imnoise(img,"salt & pepper");
figure(); imshow(imSP); title('SPO');

k = ones(5)/25;
imSProm = imfilter(double(imSP), k);
figure(); imshow(imSProm, []); title('SP Promedio');
imSPMed = medfilt2(imSP, [5,5]);
figure(); imshow(imSPMed); title('SP Mediana');
imSPGauss = imgaussfilt(double(imSP), 3, "FilterSize", 5);
figure(); imshow(imSPGauss, []); title('SP Gauss');

%% Poisson Noise
img = rgb2gray(imread('mau.jpg'));
imPoisson = imnoise(img, "poisson");
figure(); imshow(imPoisson); title('poissonO');

k = ones(5)/25;
imPoissonProm = imfilter(double(imPoisson), k);
figure(); imshow(imPoissonProm, []); title('Poisson Promedio');
imPoissonMed = medfilt2(imPoisson, [5,5]);
figure(); imshow(imPoissonMed); title('Poisson Mediana');
imPoissonGauss = imgaussfilt(double(imPoisson), 3, "FilterSize", 5);
figure(); imshow(imPoissonGauss, []); title('Poisson Gauss');





%% Speckle
img = rgb2gray(imread('mau.jpg'));
imSpeckle = imnoise(img, "speckle");
figure(); imshow(imPoisson); title('speckleO');

k = ones(5)/25;
imSpeckleProm = imfilter(double(imSpeckle), k);
figure(); imshow(imSpeckleProm, []); title('Speckle Promedio');
imSpeckleMed = medfilt2(imSpeckle, [5,5]);
figure(); imshow(imSpeckleMed); title('Speckle Mediana');
imSpeckleGauss = imgaussfilt(double(imSpeckle), 3, "FilterSize", 5);
figure(); imshow(imSpeckleGauss, []); title('Speckle Gauss');
