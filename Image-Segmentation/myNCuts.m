function clusterIdx = myNCuts(anAffinityMat, k)

[M, N] = size(anAffinityMat);   %getting the dimensions of the affinity matrix
W = anAffinityMat;
L = zeros(M, N);    %initialization of laplacian matrix   
D = zeros(M, N);    %initialization of diagonal matrix
sum = 0;

%calculating the diagonal matrix
for l = 1:M
    for m = 1:N
        sum = sum + W(l,m);
        D(l, l) = sum;
    end
    sum = 0;
end

%calculating the laplacian matrix
for i = 1:M
    for j = 1:N
        L(i,j) = D(i,j) - W(i,j);     
    end
end

%calculating the k smallest eigenvalues and their respective eigenvectors
%for the generic eigenvalue problem
[U, ~] = eigs(L,D, k,'SM'); %V vectors, D values
clusterIdx = kmeans(U,k);

Ncut = calculateNcut(W, clusterIdx);
disp(Ncut);

end

