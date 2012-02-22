function out = gaussfilter(in,sigma)

    % width = 2*(sigma*3.0)+1;
    x = -ceil(3.0*sigma):ceil(3.0*sigma);
    G = gauss(x, sigma);
    
    n = length(x);
    imp = zeros(n,n);
    c = floor((n+1)/2);
    imp(c,c) = 255;
    
    kern = conv2(G,G,imp);
    
    out = conv2(in, kern, 'same');

end