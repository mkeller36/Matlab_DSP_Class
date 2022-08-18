function [img_filt,filt] = GaussianBlur(img,sigma)
% Use fspecial to generate the Gaussian filter
filt = fspecial('gaussian',[ceil(sigma*6),ceil(sigma*6)],sigma);
% Apply the filter to the image using convolution
img_filt = conv2(img,filt,'same');
end