function [M, V] = computeInitialMV(data, h0, vX)

numSeq=size(data,1)/vX;
M=NaN(1,numSeq);
S=NaN(1,numSeq);
V=NaN(1,numSeq);

for i=1:numSeq
    M(i)=mean(data((i-1)*vX+1:i*vX));
    S(i)=sum((data((i-1)*vX+1:i*vX)-M(i)).^2);
    V(i)=(S(i)/(vX-1))^h0;
end
