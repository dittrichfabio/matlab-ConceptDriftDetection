function [P] = estimateClassificationErrorP(VS0, K0)

P=testc(VS0, K0);

% [~,classificationLabels]=myKNN(trainingData,testingData,k);
% errors=testingData(:,2)==classificationLabels;
% P=1-sum(errors)/size(testingData,1);