img_mano = rgb2gray(imread('huesos.jpg'));
figure(); imshow(img_mano);
[y,x,v] = size(img_mano);

edit1 = zeros(size(img_mano));
edit1(img_mano>120 & img_mano<200) = 1;
figure(); imshow(edit1);

%% Contraste
img = imread('pai.jpg');
figure(); imshow(img);

%imtool(img);
contrast_img = (255/190)*(img-55);
figure(); imshow(contrast_img);

imH = histeq(contrast_img);
figure(); imshow(imH);