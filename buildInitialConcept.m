function [Z, F, P, TS0, VS0, h0, K0, K, k, W, kW] = buildInitialConcept(data, vE, vX)

Z=cell(1,5);
F=cell(1,5);
P=cell(1,5);

%set of available supervised couples (one out of 5 observations)
Z{1}=data(5:5:end,:);
numberSupervisedSamples=size(Z{1},1);
numberForTraining=vE;

TS0=Z{1}(1:numberForTraining,:);
VS0=Z{1}(numberForTraining+1:end,:);


%set of features characterizing the concept (M, V)

h0=computeh0exponent(data);
[M,V]=computeInitialMV(data(:), h0, vX);

F{1}(1,:)=M;
F{1}(2,:)=V;

%dynamic k
[K,k]=knnc(Z{1});
[W,kW]=knnc(Z{1}(end-39:end,:));

%k=1
% [K,k]=knnc(Z{1},1);
% [W,kW]=knnc(Z{1}(end-39:end,:),1);

K0=knnc(TS0,1);

j=1;
for i=1:vE:numberSupervisedSamples-numberForTraining
    P{1}(j)=estimateClassificationErrorP(VS0(i:vE*j,:),K0);
    j=j+1;
end


