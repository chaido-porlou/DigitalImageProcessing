function keypointsHighC = discardLowContrasted(DoGs, keypoints, p)  % function for discarding low contrasted keypoints

[a, ~] = size(keypoints);
[x, y, c, ~] = size(DoGs); 

nspo = c - 2;
t = ((2^(1/nspo) - 1)/(2^(1/3) - 1))*0.015;
k = 1;

% for loop for all keypoints 
for i = 1:a
    resize_value = keypoints(i,1);
    % A is the X*Y level array where a keypoint is located
    A = DoGs{x/(2^(resize_value-1)), y/(2^(resize_value-1)), keypoints(i, 2), keypoints(i, 1)};
    % if the absolute value (brightness) of the keypoint is bigger than the wanted
    % brightness (p*t), the keyopint is deemed high contrasted
    if abs(A(keypoints(i, 3), keypoints(i, 4))) > p*t   % p shows the strictness of the choice
        keypointsHighC(k, :) = keypoints(i, :);
        k = k + 1;
    end
end

end

