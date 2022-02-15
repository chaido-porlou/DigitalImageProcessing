function [spacescales, DoGs] = myDoGs(img , K, sigma , levels , octaves) %function for the creation of spacescale and DoGs cell arrays

[N, M] = size(img); % using the original image's size for first octave calculation
spacescales = cell(N, M, levels, octaves);  % initialization of a 4D cell array for spacescales (every octave has the given number of levels)
DoGs = cell(N, M, levels-1, octaves);   % initialization of a 4D cell array for DoGs (every octave has one less level)

nextSigma = 0;
s1 = img;   % using the given image as starting image/array
newSigma = sigma;   % using the given sigma as starting sigma
resize_value = 1;
k = 1.2;

% calculation of spacescales
for i = 1:octaves
    for j = 1:levels
        s = conv2(s1, my2DGaussianFilter(K, newSigma),'same');  % calculating every level of an octave by convoluting the resized starting image and a gaussian filter with a multiplied by k sigma
        spacescales{N, M, j, i} = s;    % putting the spacescale into a cell array
        if (j == 3) 
            nextSigma = newSigma;   % the sigma that will be used in the next octave as starting sigma is the sigma of the previous 3rd spacescale
        end
        newSigma = newSigma*k;  % for every next level in an octave, the new sigma is calculated by multiplying the previous sigma with k
    end
    newSigma = nextSigma*k; % calculating the starting sigma for the next octave
    s1 = imresize(img, (0.5/2^(resize_value-1)));   % resizing and downsampling the starting image for it to be used in the next octave
    resize_value = resize_value + 1;    
    [N, M] = size(s1);  % using the new image size for next octave
end

[N, M] = size(img); % using the original image's size for first DoGs octave calculation

for i = 1:octaves
    for j = 1:(levels - 1)  % counting until levels-1 because a DoGs octave has 1 less level than a spacescale octave
        DoGs{N, M, j, i} = spacescales{N, M, j+1, i} - spacescales{N, M, j, i}; % calculating DoGs and putting them into a cell array
    end
    N = N/2;    % changing size for every
    M = M/2;    % DoGs octave
end


end

