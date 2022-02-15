function q = myquant(x, w) % quantizer for matrix x, with step size w

steps = 2*(1/w); % number of steps
q1 = x/w;        % division of matrix contents with step size 
q = floor(q1);   % calculation of quantizer symbols

end

