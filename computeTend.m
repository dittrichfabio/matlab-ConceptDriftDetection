function [Tend] = computeTend(data,confEnd,initData,endData,numTrainSeq,vX,h0,gamma)

% if endData==20
%     endData=1;
% end

conf=confEnd;

val=0;
init=initData+20;
while val==0 && init>endData
    init=init-20;
    QX=data(init-19:init,:);
    [M,V]=computeMV(QX, h0, vX);
    [val,conf]=CDTx(M,V,conf,numTrainSeq,gamma);
end
if val==0
    Tend=floor(initData*0.9/20)*20;
    return;
end

Tend=init;