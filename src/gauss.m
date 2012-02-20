function G = gauss(x,sigma)

    G = 1/sqrt(2*pi)/sigma * exp(-(x.^2)/2/sigma^2);

end