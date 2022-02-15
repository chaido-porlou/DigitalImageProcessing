clc;

mountains_resized = imresize(mountains, 5);

% calling spacescale and DoGs function for 2 different level and octave
% values and image "mountains"
[W1, W2] = myDoGs(mountains_resized, 7, sqrt(2), 5, 3);
[W3, W4] = myDoGs(mountains_resized, 7, sqrt(2), 3, 7);

roofs_resized = imresize(roofs, 5);

% calling spacescale and DoGs function for 2 different level and octave
% values and image "roofs"
[W5, W6] = myDoGs(roofs_resized, 7, sqrt(2), 5, 3);
[W7, W8] = myDoGs(roofs_resized, 7, sqrt(2), 3, 7);

% creating a cell array for easier visualization
W = cell(8,1);
W{1,1} = W1;
W{2,1} = W2;
W{3,1} = W3;
W{4,1} = W4;
W{5,1} = W5;
W{6,1} = W6;
W{7,1} = W7;
W{8,1} = W8;

for w = 1:2:7

x = 0;
figure();
[a, b, c, d] = size(W{w,1});   % using the starting size of spacescales cell array
[a1, b1, c1, d1] = size(W{w+1,1});  % using the starting size of DoGs cell array

% for loop for spacescales visualization
for i = 1:d
    for j = 1:c
        subplot(d, c, j+x);
        imshow(W{w,1}{a, b, j, i});       
    end
    x = x+c;
    a = a/2;
    b = b/2;
end


x=0;
figure();

% for loop for DoGs visualization
for i = 1:d1
    for j = 1:c1
        subplot(d1, c1, j+x);
        A = W{w+1,1}{a1, b1, j, i};
        % normalizing the values to [0,1] using the maximum and minimum
        % value of the level for better visualization (no negative values)
        an = max(A(:));
        bn = min(A(:));
        imshow(A, [bn an]);       
    end
    x = x+c1;
    a1 = a1/2;
    b1 = b1/2;
end

end