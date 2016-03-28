function [C1,C2,C3,C4,C5,C6] = computeDistributionCumulants(data)

u=computeMoments(data);
k=u(1);
for n=2:6
    value=0;
    for m=1:n-1
        comb=numberOfCombination(n-1,m-1);
        if comb==0
            break
        end
        value=value+comb*k(m)*u(n-m);
    end
    k(n)=u(n)-value;
end

C1=k(1);
C2=k(2);
C3=k(3);
C4=k(4);
C5=k(5);
C6=k(6);