function [confX] = configureCDTx(F,numTrainSeq,gamma)

confX.meanM=mean(F(1,:));
confX.stdM=std(F(1,:));
confX.stdMS=confX.stdM/sqrt(numTrainSeq);
confX.meanV=mean(F(2,:));
confX.stdV=std(F(2,:));
confX.stdVS=confX.stdV/sqrt(numTrainSeq);
confX.intervalM.F=confX.meanM-gamma*confX.stdMS;
confX.intervalM.L=confX.meanM+gamma*confX.stdMS;
confX.intervalV.F=confX.meanV-gamma*confX.stdVS;
confX.intervalV.L=confX.meanV+gamma*confX.stdVS;
confX.s=numTrainSeq;
confX.numTrainSeq=numTrainSeq;
