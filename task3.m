A= imread('mau.jpg');
figure(); imshow(A);

AR=imrotate(A,45);
figure ();imshow(AR);
AT=imtranslate (A, [120,100]);
figure();imshow(AT);
ARI=imresize(A,2.3);
figure();imshow(ARI);

AF=flip(A);
figure();imshow(AF);
AF2 = fliplr(A);
figure ();imshow(AF2);

[y,x,h] = size(A);
AC = imcrop(A, [1, 1, x/2, y/2]);
figure();imshow (AC);

AC2=imcrop(A, [x/2, y/2 , x, y]);
figure(); imshow(AC2);

%