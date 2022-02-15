function xrgb = bayer2rgb(xb) % conversion from bayer filter image to rgb image

[I, J] = size(xb);
green = zeros (I,J); % initialization

% creation of green only matrix, using the initial green sensors
for i = 1:I
   if (mod(i,2) == 0)
    for j = 2:2:J
      green(i,j) = xb(i,j);
    end
   else
    for j = 1:2:J
        green(i,j) = xb(i,j);
    end
   end
end

red = zeros(I,J); % initialization

% creation of red only matrix, using the initial red sensors
for i = 2:2:I
  for j = 1:2:J
   red(i,j) = xb(i,j);
  end
end

blue = zeros(I,J); % initialization

% creation of blue only matrix, using the initial blue sensors
for i = 1:2:I
  for j = 2:2:J
   blue(i,j) = xb(i,j);
  end
end

kr = [1/4 1/2 1/4; 1/2 1 1/2; 1/4 1/2 1/4] % kernel for red
kb = [1/4 1/2 1/4; 1/2 1 1/2; 1/4 1/2 1/4] % kernel for blue
kg = [0 1/4 0; 1/4 1 1/4;0 1/4 0]          % kernel for green


% convolution for each colour to fill the empty pixels (averaging between
% neighbor ones)
br = conv2(kr, red);  
bg = conv2(kg, green);
bb = conv2(kb, blue);

% creation of rgb image
image = cat(3, br, bg, bb);

% cutting edges because convolution image was bigger
Nkeep=I;
Mkeep=J;
image=image(1:Nkeep,1:Mkeep, 1:3);

xrgb = image;

end

