function [moments] = computeMoments(data)


u1=mean(data.data);
u2=mean(data.data.^2);
u3=mean(data.data.^3);
u4=mean(data.data.^4);
u5=mean(data.data.^5);
u6=mean(data.data.^6);
moments=[u1 u2 u3 u4 u5 u6];