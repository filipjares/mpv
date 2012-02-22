function [dxx,dxy,dyy] = gaussderiv2(in,sigma)

    [dx, dy] = gaussderiv(in, sigma);
    
    kern = [-1 0 1]/2;
    
    dxx = conv2(dx, kern, 'same');
    dyy = conv2(dy, kern', 'same');
    dxy = conv2(dx, kern', 'same');

end