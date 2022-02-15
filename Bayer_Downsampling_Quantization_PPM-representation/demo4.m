% demo 4, project pipeline

image_1 = bayer2rgb(x);
image_2 = myresize(image_1, 150, 200, 'linear');
imshow(image_2);
image_3 = imagequant(image_2, 1/2^3, 1/2^3, 1/2^3);
figure();
saveasppm(image_3, 'dip_is_fun.ppm', 2^3);
imshow('dip_is_fun.ppm');