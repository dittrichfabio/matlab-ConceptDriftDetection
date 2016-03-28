function [k1,k2,k3] = computeApproximationCumulants(data)

numberOfSamples=size(data,1);

[~,C2,C3,C4,~,C6]=computeDistributionCumulants(data);


k1=numberOfSamples-1;

k2=(numberOfSamples-1)^2*(C4/(numberOfSamples*C2^2)+2/(numberOfSamples-1));

k3=(numberOfSamples-1)^3*(C6/numberOfSamples^2+12*C4*C2/(numberOfSamples*(numberOfSamples-1))+4*(numberOfSamples-2)*C3^2/(numberOfSamples*(numberOfSamples-1)^2)+8*C2^3/((numberOfSamples-1)^2))/C2^3;