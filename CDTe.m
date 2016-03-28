function [val,confE] = CDTe(p0,confE,numTrainSeq,gamma)

vE=20;

confE.s=confE.s+1;
confE.mean(end+1)=((confE.s-1)*confE.mean(confE.s-numTrainSeq)+p0*vE)/confE.s;
confE.stdS(end+1)=confE.std/sqrt(confE.s);

I.F=confE.mean(end)-gamma*confE.stdS(end);
I.L=confE.mean(end)+gamma*confE.stdS(end);

confE.interval(end+1)=intervalIntersection(I,confE.interval(confE.s-numTrainSeq));

if (isnan(confE.interval(end).F))
    val=1;
else
    val=0;
end




% confE.s=confE.s+1;
% confE.mean(end+1)=((confE.s-1)*confE.mean(confE.s-numTrainSeq)+P)/confE.s;
% confE.stdS(end+1)=confE.std/sqrt(confE.s);
% 
% I.F=confE.mean(end)-gamma*confE.stdS(end);
% I.L=confE.mean(end)+gamma*confE.stdS(end);
% 
% confE.interval(end+1)=intervalIntersection(I,confE.interval(confE.s-numTrainSeq));
% 
% if (isnan(confE.interval(end).F))
%     val=1;
% else
%     val=0;
% end