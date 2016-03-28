function [val] = equivalentConcepts(F,Z,i,j)

%if ttest2 returns 1 -> there is a difference
%if ttest2 returns 0 -> sets are equivalent
h1=ttest2(F{i}(1,:),F{j}(1,:),0.1,[],'unequal');
h2=ttest2(F{i}(2,:),F{j}(2,:),0.1,[],'unequal');
if h1+h2~=0
    val=0;
    return
end

sizeZi=size(Z{i},1);
sizeZj=size(Z{j},1);
tau=0.8;

if sizeZi<sizeZj
    TSi=Z{i}(1:sizeZi,:);
    TSj=Z{j}(1:sizeZi,:);
    VS=Z{j}(sizeZi+1:end,:);
else
    TSi=Z{i}(1:sizeZj,:);
    TSj=Z{j}(1:sizeZj,:);
    VS=Z{i}(sizeZj+1:end,:);
end

Ki=knnc(TSi);
Kj=knnc(TSj);

q=(sum(VS*Ki*labeld==VS*Kj*labeld)/size(VS,1));
if q>=tau %concepts are equivalent
    val=1;
else
    val=0;
end