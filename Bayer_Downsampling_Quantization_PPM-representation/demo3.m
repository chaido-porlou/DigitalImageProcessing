% demo 3, quantization and dequantization of image with 3 bits per colour

quantized_image = imagequant(rgb_image, 1/2^3, 1/2^3, 1/2^3);
imshow(quantized_image);

dequantized_image = imagedequant(quantized_image, 1/2^3, 1/2^3, 1/2^3);
imshow(dequantized_image);