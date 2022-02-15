clc;
%image d2a

a = Image2Graph(d2a);   %creation of the affinity matrix
rng(1);
im_a = myNCutsRec(a, 2, 5, 0.51, 1);    %running recursive ncuts 
shades_a = unique(im_a);    %values of the shades of the image
shades_count_a = length(shades_a);  %count of the shades

temp = reshape(im_a, [50,50]);
im2_a = transpose(temp);
subplot(1,2,1)
imshow(im2_a, [0 max(shades_a)]);   %imshow that matches shades values to brightness values (0,1) 

b = Image2Graph(d2b);   %creation of the affinity matrix
rng(1);
im_b = myNCutsRec(b, 2, 5, 0.79, 1);    %running recursive ncuts 
shades_b = unique(im_b);    %values of the shades of the image
shades_count_b = length(shades_b);  %count of the shades

temp = reshape(im_b, [50,50]);
im2_b = transpose(temp);
subplot(1,2,2)
imshow(im2_b, [0 max(shades_b)]);   %imshow that matches shades values to brightness values (0,1) 