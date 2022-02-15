clc;

%image d2a
a = Image2Graph(d2a);   %creating the affinity matrix that will be used in spectral clustering

rng(1);
ID2_a = mySpectralClustering(a, 2);

temp = reshape(ID2_a, [50,50]);
im2_a = transpose(temp);
subplot(2,3,1)
imshow(im2_a, [0 2]);

rng(1);
ID3_a = mySpectralClustering(a, 3);

temp = reshape(ID3_a, [50,50]);
im3_a = transpose(temp);
subplot(2,3,2)
imshow(im3_a, [0 3]);

rng(1);
ID4_a = mySpectralClustering(a, 4);

temp = reshape(ID4_a, [50,50]);
im4_a = transpose(temp);
subplot(2,3,3)
imshow(im4_a, [0 4]);

%image d2b
b = Image2Graph(d2b);   %creating the affinity matrix that will be used in spectral clustering

rng(1);
ID2_b = mySpectralClustering(b, 2);

temp = reshape(ID2_b, [50,50]);
im2_b = transpose(temp);
subplot(2,3,4)
imshow(im2_b, [0 2]);

rng(1);
ID3_b = mySpectralClustering(b, 3);

temp = reshape(ID3_b, [50,50]);
im3_b = transpose(temp);
subplot(2,3,5)
imshow(im3_b, [0 3]);

rng(1);
ID4_b = mySpectralClustering(b, 4);

temp = reshape(ID4_b, [50,50]);
im4_b = transpose(temp);
subplot(2,3,6)
imshow(im4_b, [0 4]);

