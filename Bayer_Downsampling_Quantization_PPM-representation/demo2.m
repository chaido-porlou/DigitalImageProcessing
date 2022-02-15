% demo 2, downsampling with nearest neighbor method and bilinear
% interpolation method

image_nearest = myresize(rgb_image, 240, 320, 'nearest');
imshow(image_nearest);

figure();
image_linear = myresize(rgb_image, 200, 300, 'linear');
imshow(image_linear);
