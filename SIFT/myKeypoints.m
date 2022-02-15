function keypoints = myKeypoints(DoGs)  % function for finding keypoints in the DoGs cell array

[a, b, c, d] = size(DoGs);  % using the starting values of the DoGs cell array for image size, levels and octaves

% initializations of the variables that will be used
nA = zeros(1, 9);
nB = zeros(1, 9);
nC = zeros(1, 9);

key = 1;
between = 1;
up = 1;
down = 1;

% calculation of the keypoint array
for k = 1:d
    % searching for keypoints in the inner levels of an octave 
    for l = 2:c-1
        % finding neighbours for all values of a level that have 26
        % neighbours (ignoring outline indexes)
        for i = 2:(a-1)
            for j = 2:(b-1)
                % A, B, C are the arrays of middle, below and above
                % levels of a DoGs octave respectfully (middle octave
                % obviously can't be the first or last octave level)
                A = DoGs{a, b, l, k};
                B = DoGs{a, b, l-1, k};
                C = DoGs{a, b, l+1, k};   
                % calculation of lists nA, nB, nC with neighbours 
                % from central, below and above level 
                for new_i = (i-1):(i+1)
                    for new_j = (j-1):(j+1)            
                        nA(between) = A(new_i, new_j);
                        between = between + 1;
                        nB(down) = B(new_i, new_j);
                        down = down + 1;
                        nC(up) = C(new_i, new_j);
                        up = up + 1;                       
                     end
                end
                all = [nA, nB, nC]; % list of all 26 neighbours and central value
                between = 1;
                up = 1;
                down = 1;
                % marking value and index as a keypoint if it's
                % bigger/smaller than (or equal to) the biggest/smallest
                % value of the neighbour list
                if A(i, j) == max(all) || A(i, j) == min(all)
                    % filling up the keypoint array with octave, level and
                    % coordinates of found keypoint
                    keypoints(key, 1) = k;
                    keypoints(key, 2) = l;
                    keypoints(key, 3) = i;
                    keypoints(key, 4) = j;
                    key = key + 1;
                 end
            end
        end
    end
    % changing size for every octave
    a = a/2;
    b = b/2;
end
end

