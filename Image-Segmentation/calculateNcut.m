function nCutValue = calculateNcut(anAffinityMat, clusterIdx)

[S] = size(clusterIdx); %getting the size of the id matrix
W = anAffinityMat;
%initialization of sums for assoc calculation
sum1 = 0;   
sum2 = 0;
sum3 = 0;
sum4 = 0;

%calculation of assoc(A, A), adding up the weights between nodes that
%belong to cluster A only
for u = 1:S
    for t = 1:S
        if (clusterIdx(u) == 1 && clusterIdx(t) == 1)
         sum1 = sum1 + W(u,t);
        end
    end
end

%calculation of assoc(A, V), adding up the weights between nodes that
%belong to cluster A and nodes that belong to ALL clusters
for u = 1:S
    for t = 1:S
        if clusterIdx(u) == 1
         sum2 = sum2 + W(u,t);
        end
    end
end

%calculation of assoc(B, B), adding up the weights between nodes that
%belong to cluster B only
for u = 1:S
    for t = 1:S
       if (clusterIdx(u) == 2 && clusterIdx(t) == 2)
         sum3 = sum3 + W(u,t);
        end
    end
end

%calculation of assoc(B, V), adding up the weights between nodes that
%belong to cluster B and nodes that belong to ALL clusters
for u = 1:S
    for t = 1:S
        if clusterIdx(u) == 2
         sum4 = sum4 + W(u,t);
        end
    end
end

Nassoc = (sum1/sum2) + (sum3/sum4); %calculation of Nassoc
Ncut = 2 - Nassoc;  %calculation of final Ncut
nCutValue = Ncut;

end

