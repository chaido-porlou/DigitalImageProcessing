function myAffinityMat = Image2Graph(imIn)

[M, N, K] = size(imIn);   %getting the size of the original matrix/image
myAffinityMat = zeros(M*N, M*N);  %initialization of returning array
i = 1; 
j = 1;  
d1 = 0; 
   
%iteration of original matrix so the affinity matrix can be calculated
for l = 1:M
  for m = 1:N
      for k = 1:M
          for n = 1:N
             for dim = 1:K
             d1 = d1 + (imIn(l,m,dim) - imIn(k,n,dim))^2;   %calculating the square sum (for all dimensions)
             end
             d = sqrt(d1);  %calculating the square root of the above square sum to get the euclidean distance
             d1 = 0;    %initializing d1 to use it for the next iteration
             myAffinityMat(i,j) = exp(-d); %filling up the affinity matrix
             j = j+1; 
          end
      end
     j = 1;
     i = i+1;
  end
end

end

