function y = GaussianFilter(x, sigma)
% Compute W by rounding up 6*sigma
w = round(6*sigma);

% Use fspecial to create our Gaussian filter
filter = fspecial('gaussian',[1,w], sigma);

% convolve the signal with the filter
y = conv(x,filter,'same');