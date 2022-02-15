function clusterIdx = mySpectralClustering(anAffinityMat , k)

[M, N] = size(anAffinityMat);   %getting the dimensions of the affinity matrix
W = anAffinityMat;
L = zeros(M, N);    %initialization of laplacian matrix   
D = zeros(M, N);    %initialization of diagonal matrix
sum1 = 0;

%calculating the diagonal matrix
for l = 1:M
    for m = 1:N
        sum1 = sum1 + W(l,m);   
    end
    D(l, l) = sum1;
    sum1 = 0;
end

%calculating the laplacian matrix
for i = 1:M
    for j = 1:N
        L(i,j) = D(i,j) - W(i,j);     
    end
end

%calculating the k smallest eigenvalues and their respective eigenvectors
[U, ~] = eigs(L,k,'SM'); %U vectors, D values (not calculated/needed)
clusterIdx = kmeans(U,k);   %kmeans algorithm

end

