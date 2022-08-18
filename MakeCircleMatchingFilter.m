function [filter,xc,yc] = MakeCircleMatchingFilter(diameter,W)
% initialize filter
filter = zeros(W);
% define coordinates for the center of the WxW filter
xc = (W + 1)/2; 
yc = (W + 1)/2;
% Use double-for loops to check if each pixel lies in the foreground of the circle
for i = 1:W 
    for j = 1:W
        filter(i,j) = sqrt((j-xc)^2 + (i-yc)^2) <= sqrt((diameter/2)^2);
    end
end
end
