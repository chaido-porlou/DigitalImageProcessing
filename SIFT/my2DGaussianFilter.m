function myGFilter = my2DGaussianFilter(K, sigma) % function for 2D Gaussian filter creation

myGFilter = zeros(K, K);    % size of the gaussian filter
filterSum = 0;
i = 1;
j = 1;

for x = -(K-1)/2:(K-1)/2    % choosing -(K-1)/2 to (K-1)/2 so the filter is 
    for y = -(K-1)/2:(K-1)/2    % centered around (0,0)
        myGFilter(i,j) = (1/(2*pi*sigma^2))*exp(-(x^2 + y^2)/(2*sigma^2));
        filterSum = filterSum + myGFilter(i,j); % calculating sum of all filter values
        i = i+1;
    end
    i = 1;  % moving to 
    j = j+1;    % the next index
end

myGFilter = myGFilter/filterSum;    % normalization of the filter, values between [0,1]

end

