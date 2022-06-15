img = imread('puppybueno.jpg');

gray = double(rgb2gray(img));



nolineal1 = ((gray/255).^(1/0.15))*(255);
nolineal2 = ((gray/255).^(1/1))*(255);
nolineal3 = ((gray/255).^(1/0.01))*(255);


figure(); imshow(nolineal1);
figure(); imshow(nolineal2);
figure(); imshow(nolineal3);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R = double(img(:,:,1));
G = double(img(:,:,2));
B = double(img(:,:,3));

R = ((R/255).^(1/0.15))*(255);
G = ((G/255).^(1/1))*(255);
B = ((B/255).^(1/0.01))*(255);


result = cat(3,R,G,B);
figure(); imshow(result);