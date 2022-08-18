img = imread('cameraman.tif');
filt = fspecial('motion');
img2 = conv2(img, filt,'same');
a = mean(mean(img2));
fprintf('%f.2 \n',a);