function id = myNCutsRec(anAffinityMat, k, T1, T2, cluster)

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
[U, ~] = eigs(L, D, k,'SM'); %V vectors, D values
labels = kmeans(U,k);   %kmeans algorithm
Ncut = calculateNcut(W, labels);    %calculating ncut

Ones = find(labels == 1);   %finding the indices of the number 1 (cluster A) in the id matrix
Twos = find(labels == 2);   %finding the indices of the number 2 (cluster B) in the id matrix
[Ones_sum, ~] = size(Ones); %count of indices of the number 1
[Twos_sum, ~] = size(Twos); %count of indices of the number 2


%DIFFERENT VERSION

%%if (Ncut < T2)  %checking the T2 constraint here, in order to "fix" the bisection if needed

%DIFFERENT VERSION    


%filling up the id matrix accordingly (cluster == left leaf of the tree)
id(Ones, 1) = cluster;  
id(Twos, 1) = cluster + 1;

disp(Ncut);

%checking the constraints T1, T2 and running the recursion for each cluster
if (Ncut < T2)
    if (Ones_sum > T1)  
        id(Ones,1) = myNCutsRec(anAffinityMat(Ones, Ones), k, T1, T2, 2*cluster + 1);   %running ncuts for left leaf/cluster 1
    end
    if (Twos_sum > T1)
        id(Twos,1) = myNCutsRec(anAffinityMat(Twos, Twos), k, T1, T2, 2*cluster + 3);   %running ncuts for right leaf/cluster 2
    end

%DIFFERENT VERSION
%in case ncut > T2, the kmeans has already bisected the clusters wrongly
%so we fill both clusters with the same shade/color in order to "undo" the
%bisection

% % else
% %     id(Ones, 1) = cluster;
% %     id(Twos, 1) = cluster;        
% % end

%DIFFERENT VERSION


end

