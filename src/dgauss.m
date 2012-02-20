function D = dgauss(x,sigma)
    
    D = - 1/sqrt(2*pi)/sigma^3 .* x .* exp(-(x.^2)/2/sigma^2);

end