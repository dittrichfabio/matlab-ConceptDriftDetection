function [val,Tref,T0] = refinementProcedure(T,lambda,gamma,vX,h0,T0,conf,numTrainSeq,data)

Ti(1)=round(T0+(T-T0)/lambda);
if mod(Ti(1),20)<=10
    Ti(1)=Ti(1)-mod(Ti(1),20);
else
    Ti(1)=Ti(1)-mod(Ti(1),20)+20;
end
i=1;
Tmin=Inf;

while true
%     confX.meanM=meanM;confX.stdM=stdM;confX.stdMS=stdMS;
%     confX.meanV=meanV;confX.stdV=stdV;confX.stdVS=stdVS;
%     confX.intervalM=intervalM;confX.intervalV=intervalV;
    localConf=conf;
    localConf.meanM(2:end)=[];
    localConf.stdMS(2:end)=[];
    localConf.meanV(2:end)=[];
    localConf.stdVS(2:end)=[];
    localConf.intervalM(2:end)=[];
    localConf.intervalV(2:end)=[];
    localConf.s=localConf.numTrainSeq;
    
    val=0;
    s=numTrainSeq;
    init=Ti(i)-20;
    while val==0 && init<T
        init=init+20;
        QX=data(init:init+19,:);
        [M,V]=computeMV(QX, h0, vX);
        [val,localConf]=CDTx(M,V,localConf,numTrainSeq,gamma);
    end
    if val==0
        Tref=T;
        return;
    end
    Ti(i+1)=round(Ti(i)+(T-Ti(i))/lambda);
    Tmin=min(Tmin,init);
    if mod(Ti(i+1),20)<=10
        Ti(i+1)=Ti(i+1)-mod(Ti(i+1),20);
    else
        Ti(i+1)=Ti(i+1)-mod(Ti(i+1),20)+20;
    end
    if Tmin<Ti(i+1) || Ti(i)==Ti(i+1)
        break
    end

    i=i+1;
end

Tref=Tmin;
T0=T;