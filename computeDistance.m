function [d] = computeDistance(x, y)

%euclidean distance
d=sqrt(sum((x-y).^2));
