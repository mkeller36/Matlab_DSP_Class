% Define the filter size we will use in step 2:
filtsize = 85;

% Creating test image 'im' by splicing together two built in images.
% Also zero-padding (adding zeros around the border) with half the 
% filter size (filtsize) we will use so that the filter could be 
% centered on any actual image pixel, including those near the border.
% 'coins.png' contains bright nickels and dimes on a dark background
% 'eight.tif' contains dark quarters on a bright background, so we invert it
% to match 'coins.png'
im1 = imread('coins.png');
[r,c] = size(im1);
im2 = imread('eight.tif');
[r2,c2] = size(im2);
filtsizeh = floor(filtsize/2);
im = zeros(r+r2+filtsize,c+filtsize);
im(filtsizeh+1:filtsizeh+r+r2,filtsizeh+1:filtsizeh+c) = [im1;255-im2(:,1:c)];
[r,c] = size(im);
imagesc(im);colormap(gray);title('test image');axis equal;

% Initializing assessed/displayed variables as empty so that code is executable 
msk=[]; msk_dil=[]; msk_dil_erd=[]; centroid=[]; component_size=[]; 

%%%%% 1. Localize the centroid of each coin
% Otsu threshold
[msk,thrsh] = OtsuThreshold(im);

figure; imagesc(msk); colormap(gray); title('Otsu'); axis equal;

% Dilate 
%SE = strel("disk",ones(7,7)); ones(5,5)
msk_dil = imdilate(msk,strel("disk",5));

figure; imagesc(msk_dil); colormap(gray); title('Dilated'); axis equal;

% Erode 
%ones(5,5)
msk_dil_erd = imerode(msk_dil,strel("disk",12));

figure; imagesc(msk_dil_erd); colormap(gray); title('Eroded'); axis equal;

% Connected components to get centroids of coins:
stats = regionprops('table',msk_dil_erd,'Centroid','MajorAxisLength','MinorAxisLength');
centroid = round(stats.Centroid);
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
component_size = pi*radii.^2;
length(centroid)

centroid
component_size
