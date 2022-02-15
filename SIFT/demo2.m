clc;

mountains_resized = imresize(mountains, 5);

% calling spacescale and DoGs function for 2 different level and octave
% values and image "mountains"
[W1, W2] = myDoGs(mountains_resized, 19, sqrt(2), 6, 3);

roofs_resized = imresize(roofs, 5);

% calling spacescale and DoGs function for 2 different level and octave
% values and image "roofs"
[W3, W4] = myDoGs(roofs_resized, 19, sqrt(2), 6, 3);

% creating a cell array for easier visualization
W = cell(8,1);
W{1,1} = W1;
W{2,1} = W2;
W{3,1} = W3;
W{4,1} = W4;

for w = 2:2:4

% calculation of keypoints for each image 
figure();   
keypoints = myKeypoints(W{w,1});
[o, ~] = size(keypoints);
[a, b, c, d] = size(W{w,1});    % using the starting size of spacescales cell array
x = 0;

% for loop for visualization of keypoints as crosses on the DoGs image
for i = 1:d
    for j = 1:c
        subplot(d, c, j+x);
        A = W{w,1}{a, b, j, i};
        % normalizing the values to [0,1] using the maximum and minimum
        % value of the level for better visualization (no negative values)
        an = max(A(:));
        bn = min(A(:));
        imshow(A, [bn an]);
        % visualization of the keypoints on the image
        for k =1:o
            if (keypoints(k, 2) == j) && (keypoints(k, 1) == i)
                hold on
                axis on;
                plot(keypoints(k,4), keypoints(k,3), 'r+', 'MarkerSize', 1, 'LineWidth', 1, 'MarkerEdgeColor', 'b');
            end
        end
        hold off; 
    end
    x = x+c;
    a = a/2;
    b = b/2;
end

figure();
highKeys =  discardLowContrasted(W{w,1}, keypoints, 0.6);   % array of high contrasted keypoints
[o1, ~] = size(highKeys);
[a1, b1, c1, d1] = size(W{w,1});    % using the starting size of spacescales cell array
x = 0;

% for loop for visualization of high contrasted keypoints as crosses on the DoGs image
for i = 1:d1
    for j = 1:c1
        subplot(d1, c1, j+x);
        B = W{w,1}{a1, b1, j, i};
        % normalizing the values to [0,1] using the maximum and minimum
        % value of the level for better visualization (no negative values)
        an = max(B(:));
        bn = min(B(:));
        imshow(B, [bn an]);
        % visualization of the high contrasted keypoints only
        for k =1:o1
            if (highKeys(k, 2) == j) && (highKeys(k, 1) == i)
                hold on
                axis on;
                plot(highKeys(k,4), highKeys(k,3), 'r+', 'MarkerSize', 1, 'LineWidth', 1, 'MarkerEdgeColor', 'b');
            end
        end
        hold off; 
    end
    x = x+c1;
    a1 = a1/2;
    b1 = b1/2;
end


end