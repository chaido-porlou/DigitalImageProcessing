function xrgbres = myresize(xrgb , N, M, method) % subsampling and resizing of image with 2 different methods

xrgbres = zeros(N, M, 3); % initialization
[I, J, ~] = size(xrgb); 

% nearest neighbor method
if(strcmp(method, 'nearest') == 1)
 for l = 1:N
    for k = 1:M
        xrgbres(l,k,1) = xrgb(round(l*(I/N)), round(k*(J/M)), 1); % pixel scaling to choose
        xrgbres(l,k,2) = xrgb(round(l*(I/N)), round(k*(J/M)), 2); % the initial image's pixels (nearest neighbors)
        xrgbres(l,k,3) = xrgb(round(l*(I/N)), round(k*(J/M)), 3); % to add to new image
    end
 end
end

% bilinear interpolation method
if(strcmp(method, 'linear') == 1)
    
l = 1;
k = 1;
for j = (I/N)/2:(I/N):I
  for i = (J/M)/2:(J/M):J
  % for when M, N is more than half of J, I
   if j < 1  
    j = 1;
   end 
   if i < 1
    i = 1;
   end
   
   % known points that will be used in the interpolation
   x1 = floor(j);
   x2 = ceil(j);
   y2 = ceil(i);
   y1 = floor(i);
   
   % bilinear interpolation for different cases (analysis in report)
   for h=1:3
       if x1 == x2 && y1 == y2
       a1 = xrgb(x1, y1, h);
       xrgbres(l, k, h) = a1;
       
       elseif x1 == x2 && y1~=y2
       a1 = xrgb(x1, y1, h);
       a2 = xrgb(x1, y2, h);
       xrgbres(l, k, h) = ((y2 - i)/(y2 - y1))*a1 + ((i - y1)/(y2 - y1))*a2;
       
       elseif y1 == y2
       a1 = ((x2 - j)/(x2 - x1))*xrgb(x1, y1, h) + ((j - x1)/(x2 - x1))*xrgb(x2, y1, h);   
       xrgbres(l, k, h) = a1;
       
       else
       a1 = ((x2 - j)/(x2 - x1))*xrgb(x1, y1, h) + ((j - x1)/(x2 - x1))*xrgb(x2, y1, h);
       a2 = ((x2 - j)/(x2 - x1))*xrgb(x1, y2, h) + ((j - x1)/(x2 - x1))*xrgb(x2, y2, h);
       xrgbres(l, k, h) = ((y2 - i)/(y2 - y1))*a1 + ((i - y1)/(y2 - y1))*a2;
       end
  end
  k = k+1;
  end
  k = 1;
  l = l+1;
 end
end

end
