
sigma = 6.0;
x = -ceil(3.0*sigma):ceil(3.0*sigma);
G = gauss(x, sigma);
D = dgauss(x, sigma);

figure(1);
plot(x, G, x, G, 'rx'); grid on;
title('Gaussian, sigma 6.0');

figure(2);
plot(x, D, x, D, 'rx'); grid on;
title('Derivace gaussianu, sigma 6.0');

imp = zeros(51); imp(25,25) = 255;
out = conv2(G,G,imp);

figure(3);
% imagesc(out);     % either
surf(out);          % or

figure(4);
img = imread('../lenna.png');
imagesc(img(:,:,1));
colormap('gray');
figure(5);
img_f = conv2(double(out), double(img(:,:,1)));
imagesc(img_f);
colormap('gray');

%%

x1 = 120; x3 = 115; x2 = 135;
y1 = 100; y3 = 90;  y2 = 95;

A = affine(x1,y1,x2,y2,x3,y3)

