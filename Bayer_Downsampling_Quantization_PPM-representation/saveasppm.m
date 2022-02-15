function saveasppm(x, filename , K) % creation of ppm image from quantized image x and number of steps K, with name "filename" 

[M N L] = size(x);
fileID = fopen(filename,'w'); % creation of ppm file 

fprintf(fileID,'P6 %u %u %u\n', N, M, K); % writing of ppm header in file

 for i = 1:M
    for j = 1:N
% image/matrix contents saved and written as raw binary in file   
fwrite(fileID, x(i, j, 1));
fwrite(fileID, x(i, j, 2));
fwrite(fileID, x(i, j, 3));
    end
 end
 
fclose(fileID); % closing of file
 
end

