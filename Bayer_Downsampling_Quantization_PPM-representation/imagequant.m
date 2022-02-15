function q = imagequant(x, w1 , w2 , w3) % quantizer for rgb image with different step sizes for each colour

 % matrices for each colour
 r = x(:, :, 1);
 g = x(:, :, 2);
 b = x(:, :, 3);
 
 % quantization for each colour
 r1 = myquant(r, w1);
 g1 = myquant(g, w2);
 b1 = myquant(b, w3);
 
 % creation of rgb quantized image
 q = cat(3, r1, g1, b1);

end

