function [kNearestValues,kNearestIndex] = updateKNearest(d, index, kNearestValues, kNearestIndex)

if (d>kNearestValues(1,end))
    return
end

kNearestValues(1,end)=d;
kNearestIndex(1,end)=index;

[kNearestValues,sortedIndex]=sort(kNearestValues);
kNearestIndex=kNearestIndex(sortedIndex);