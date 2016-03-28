function [accuracy, knnLabels] = myKNN(trainingData, testingData, k)


numberOfTrainingSamples=size(trainingData,1);
numberOfTestingSamples=size(testingData,1);
knnLabels=inf(numberOfTestingSamples,1);

for i=1:numberOfTestingSamples
    kNearestValues=inf(1,k);
    kNearestIndex=inf(1,k);
    for j=1:numberOfTrainingSamples
        d=computeDistance(testingData(i,1:end-1),trainingData(j,1:end-1));
        [kNearestValues,kNearestIndex]=updateKNearest(d,j,kNearestValues,kNearestIndex);
    end
    %change this if there are more than 2 classes or they are different
    %than 1 and 2
    bestLabels=trainingData(kNearestIndex,end);
    if (sum(bestLabels==1)>(k/2))
        knnLabels(i,1)=1;
    else if (sum(bestLabels==1)<(k/2))
            knnLabels(i,1)=2;
        else
            knnLabels(i,1)=round(rand+1);
        end
    end
end

accuracy=sum((testingData(:,end)-knnLabels)==0)/numberOfTestingSamples;







% numberOfTrainingSamples=size(trainingData.data,1);
% numberOfTestingSamples=size(testingData.data,1);
% knnLabels=inf(numberOfTestingSamples,1);
% 
% for i=1:numberOfTestingSamples
%     kNearestValues=inf(1,k);
%     kNearestIndex=inf(1,k);
%     for j=1:numberOfTrainingSamples
%         d=computeDistance(testingData.data(i,:),trainingData.data(j,:));
%         [kNearestValues,kNearestIndex]=updateKNearest(d,j,kNearestValues,kNearestIndex);
%     end
%     %change this if there are more than 2 classes or they are different
%     %than 1 and 2
%     bestLabels=trainingData.labels(kNearestIndex);
%     if (sum(bestLabels==1)>(k/2))
%         knnLabels(i,1)=1;
%     else if (sum(bestLabels==1)<(k/2))
%             knnLabels(i,1)=2;
%         else
%             knnLabels(i,1)=round(rand+1);
%         end
%     end
% end
% 
% accuracy=sum((testingData.labels-knnLabels)==0)/numberOfTestingSamples;