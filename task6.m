img_mano = imread('xray.jpg');
[y,x] = size(img_mano);
up = img(1:y/2,1:x/3);

down = img_mano((y/2)+1:end,1:x/3);

upth = zeros(size(up));
downth = ones(size(down));

upth(up>70) = 1;
figure(); imshow(upth);

downth(down>135) = 0;
figure(); imshow(downth);

result = [upth;downth];

figure(); imshow(result);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



img = imread('lowcontrast.png');

figure(); imshow(img);
%imtool(img);

contrast_img = (255/190)*(img-55);

figure(); imshow(contrast_img);



imH = histeq(img_mano);
figure(); imshow(imH);







