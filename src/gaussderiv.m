function [dx,dy] = gaussderiv(in,sigma)

    % width = 2*(sigma*3.0)+1;
    x = -ceil(3.0*sigma):ceil(3.0*sigma);
    G = gauss(x, sigma);
    D = dgauss(x, sigma);
    
    n = length(x);
    imp = zeros(n,n);
    c = floor((n+1)/2);
    imp(c,c) = 1;
    
    kernX = conv2(G,D,imp);
    kernY = conv2(D,G,imp);
    
    dx = conv2(in, kernX, 'same');
    dy = conv2(in, kernY, 'same');

% Another alternative, it however yields opposite sign. Did not know why.
% But the answer is something like: by convention the sign used for
% convolution and filtering is not always the same, have to look it up
%
%     out = gaussfilter(in, sigma);
%     
%     kern = [-1 0 1]/2;	% FIXME: change the sign
%     
%     dx = conv2(out, kern, 'same');
%     dy = conv2(out, kern', 'same');

end
