img = imread("smart.jpeg");
im2 = imread('pai.jpg');
mau = imread('mau.jpg');


figure("Name","originales");
subplot(1,3,1); imshow(img); title('A');
subplot(1,3,2); imshow(im2); title('B');
subplot(1,3,3); imshow(mau); title('C');

ImHistEsp = imhistmatch(img, im2);
ImHistEsp1 = imhistmatch(im2, mau);
ImHistEsp2 = imhistmatch(mau, img);

figure("Name","Resultados");
subplot(1,3,1); imshow(ImHistEsp); title('de B a A');
subplot(1,3,2); imshow(ImHistEsp1); title('de C a B');
subplot(1,3,3); imshow(ImHistEsp2); title('de A a C')

