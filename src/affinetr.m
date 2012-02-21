function out = affinetr(in,A,ps,ext)
    % ps  - pixelsize, size of the square patch edge in pixels
    % ext - extent
    
    function [u, v] = can2pix(x, y)
        % transform canonical coordinates to pixel coordinates
        u = (x + ext)/pd + 1;
        v = (y + ext)/pd + 1;
    end

    function [x, y] = pix2can(u, v)
        % transform pixel coordinates to canonical coordinates
        x = (u - 1)*pd - ext;
        y = (v - 1)*pd - ext;
    end
    
    % distance between pixels
    pd = 2*ext/ps;
    
    out = zeros(ps, ps);
    
    for i = 1:ps
        for j = 1:ps
            [x, y] = pix2can(i, j);
            
            pixel = A*[x, y, 1]';
            u = pixel(1);
            v = pixel(2);
            if (outOfBounds(u, v, size(in)))
                out(j,i) = nan;
            else
                % FIXME: use matrix operations
                out(j,i) = interpolate(in, v, u);
            end
        end
    end
end

function isOut = outOfBounds(u, v, dim)
    u = round(u);
    v = round(v);
    isOut =  u < 1 || v < 1 || u > dim(1) || v > dim(2);
end

function val = interpolate(image, u, v)
    % bilinear interpolation of pixels surrounding coordinate u, v in image
    
    f00 = image(floor(u), floor(v));
    f01 = image(floor(u), ceil(v));
    f10 = image(ceil(u), floor(v));
    f11 = image(ceil(u), ceil(v));
    
    x = mod(u,1);
    y = mod(v,1);
    
    % FIXME: bilinear interpolation
    % val = image(round(u), round(v));
    
    M = [f00, f01; f10, f11];
    %val = [1-x, x] * M * [y, 1-y]';
    val = [1-x, x] * M * [1-y, y]';
end