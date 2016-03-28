function [val,confX] = CDTx(M,V,confX,numTrainSeq,gamma)

confX.s=confX.s+1;
confX.meanM(end+1)=((confX.s-1)*confX.meanM(confX.s-numTrainSeq)+M)/confX.s;
confX.stdMS(end+1)=confX.stdM/sqrt(confX.s);
confX.meanV(end+1)=((confX.s-1)*confX.meanV(confX.s-numTrainSeq)+V)/confX.s;
confX.stdVS(end+1)=confX.stdV/sqrt(confX.s);

IM.F=confX.meanM(end)-gamma*confX.stdMS(end);
IM.L=confX.meanM(end)+gamma*confX.stdMS(end);
IV.F=confX.meanV(end)-gamma*confX.stdVS(end);
IV.L=confX.meanV(end)+gamma*confX.stdVS(end);


confX.intervalM(end+1)=intervalIntersection(IM,confX.intervalM(confX.s-numTrainSeq));
confX.intervalV(end+1)=intervalIntersection(IV,confX.intervalV(confX.s-numTrainSeq));

if (isnan(confX.intervalM(end).F) || isnan(confX.intervalV(end).F))
    val=1;
else
    val=0;
end