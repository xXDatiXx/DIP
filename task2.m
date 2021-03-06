A = imread('ejemplo.jpg');

matriz = rand(5,3);
matriz(matriz(:,:)>0.52)=1;
matrizidentidad1 = [1 0 0; 0 1 0; 0 0 1];
 
R=A(:,:,1);
[y,x]=size(R);
G=A(:,:,2);
B=A(:,:,3);

Ra=R;
Ra(1:(y/2),(x/2 +1):end)=0;

Ga=G;
Ga(y/2:end,1:x/2)=0;

Ba=B;
Ba(1:(y/2),(x/2 +1):end)=0;
Ba(y/2:end,1:x/2)=0;

imA = cat(3,Ra,Ga,Ba);
figure(); imshow(imA);

Rb = R;
Gb = G;
Bb = B;

Rb(1:y/2,1:x/2)=0;
Gb(1:y/2,1:x/2)=255;
Bb(1:y/2,1:x/2)=0;

Rb(y/2+1:end,x/2+1:end)=0;
Gb(y/2+1:end,x/2+1:end)=0;
Bb(y/2+1:end,x/2+1:end)=255;

imB=cat(3,Rb,Gb,Bb);
figure; imshow(imB);