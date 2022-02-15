clc;

%image d2a
a = Image2Graph(d2a);   %creating the affinity matrix that will be used in Ncuts method

rng(1);
ID2_a = myNCuts(a, 2);

temp = reshape(ID2_a, [50,50]);
im2_a = transpose(temp);
subplot(1,2,1)
imshow(im2_a, [0 2]);


%image d2b
b = Image2Graph(d2b);   %creating the affinity matrix that will be used in Ncuts method

rng(1);
ID2_b = myNCuts(b, 2);

temp = reshape(ID2_b, [50,50]);
im2_b = transpose(temp);
subplot(1,2,2)
imshow(im2_b, [0 2]);
