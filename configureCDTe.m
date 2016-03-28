function [confE] = configureCDTe(P,numTrainSeq,gamma)

p0=mean(P);
vE=size(P,2)*20;

confE.mean=p0*vE;
confE.std=p0*(1-p0)*vE;
confE.stdS=confE.std/sqrt(numTrainSeq);
confE.interval.F=confE.mean-gamma*confE.stdS;
confE.interval.L=confE.mean+gamma*confE.stdS;
confE.s=numTrainSeq;
confE.numTrainSeq=numTrainSeq;


% confE.mean=mean(P);
% confE.std=std(P);
% confE.stdS=confE.std/sqrt(numTrainSeq);
% confE.interval.F=confE.mean-gamma*confE.stdS;
% confE.interval.L=confE.mean+gamma*confE.stdS;
% confE.s=numTrainSeq;
% confE.numTrainSeq=numTrainSeq;
