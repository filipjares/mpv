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

% jina varianta: dava to ale opacne znamenko, nevim proc
%
%     out = gaussfilter(in, sigma);
%     
%     kern = [-1 0 1]/2;
%     
%     dx = conv2(out, kern, 'same');
%     dy = conv2(out, kern', 'same');

% NOTE
%
% Convolution is computed in different orientation

end