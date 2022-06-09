A = imread('mau.jpg');

matriz = rand(5,3);
matriz(matriz(:,:)>0.52)=1;
matrizidentidad1 = [1 0 0; 0 1 0; 0 0 1];

[ySize, xSize] = size(A);
A(1:ySize/2, 1:end)=2;
figure(); imshow(A);
 

R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);
Comodin = zeros(size(R));

rojo = cat(3,R,Comodin,Comodin);
figure(); imshow(rojo);

verde = cat(3,Comodin,G,Comodin);
figure(); imshow(verde)

azul = cat(3,Comodin,Comodin,B);
figure(); imshow(azul);

gris = cat(3,G,G,G);
figure(); imshow(gris)