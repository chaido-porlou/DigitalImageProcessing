function x = mydequant(q, w) % dequantizer for quantized matrix q, with step size w

x = floor(q)*w; % giving the dequantized matrix the proper values 

end

