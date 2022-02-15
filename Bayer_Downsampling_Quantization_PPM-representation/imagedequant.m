function x = imagedequant(q, w1 , w2 , w3) % dequantizer for rgb quantized image with different step sizes for each colour


 % matrices for each colour
 r = q(:, :, 1);
 g = q(:, :, 2);
 b = q(:, :, 3);
 
 % dequantization for each colour
 r1 = mydequant(r, w1);
 g1 = mydequant(g, w2);
 b1 = mydequant(b, w3);
 
 % creation of rgb dequantized image
 x = cat(3, r1, g1, b1);

end

