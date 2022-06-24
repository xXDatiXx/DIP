img = imread('puppybueno.jpg');
img2 = imread('mau.jpg');
img3 = imread('puppy.jfif');

gray = rgb2gray(img);
gray2 = rgb2gray(img2);
gray3 = rgb2gray(img3);

figure(); h = histogram(gray);
figure(); h2 = histogram(gray2);
figure(); h3 = histogram(gray3);

gray = double(gray);

nolineal1 = ((gray/255).^(1/0.15))*(255);
nolineal2 = ((gray/255).^(1/1.5))*(255);
nolineal3 = ((gray/255).^(1/0.01))*(255);

figure(); hh1 = histogram(nolineal1);
figure(); hh2 = histogram(nolineal2);
figure(); hh3 = histogram(nolineal3);
