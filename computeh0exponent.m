function [h0] = computeh0exponent(data)

[k1,k2,k3]=computeApproximationCumulants(data);
h0=1-(k1*k3)/(3*k2^2);