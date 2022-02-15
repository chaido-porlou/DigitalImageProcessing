clc;

rng(1);
ID2 = mySpectralClustering(d1a, 2); %running spectral clustering for k = 2

temp = reshape(ID2, [4,3]); %reshape for visualization
im2 = transpose(temp);
imshow(im2, [0 2]); %imshow that matches clusterId values to brightness values (0,1)

figure();
rng(1);
ID3 = mySpectralClustering(d1a, 3);  %running spectral clustering for k = 3

temp = reshape(ID3, [4,3]);
im3 = transpose(temp);
imshow(im3, [0 3]);

figure();
rng(1);
ID4 = mySpectralClustering(d1a, 4);  %running spectral clustering for k = 4

temp = reshape(ID4, [4,3]);
im4 = transpose(temp);
imshow(im4, [0 4]);

