function [M, V] = computeMV(data, h0, vX)

M=mean(data);
S=sum((data-M).^2);
V=(S/(vX-1))^h0;
