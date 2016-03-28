function [datasetAllCycles] = generate_scalar3()
% function [datasetAllConcepts,datasetAllConceptsWithLabels] = generate_scalar1()

%Data generation according to Scalar_3
% datasetSize=10000;


meanClass1Concept1=0;
varianceClass1Concept1=4;
meanClass1Concept2=2.5;
varianceClass1Concept2=4;
meanClass2Concept1=2.5;
varianceClass2Concept1=4;
meanClass2Concept2=0;
varianceClass2Concept2=4;

dataClass1Cycle1=meanClass1Concept1+randn(1000,1)*sqrt(varianceClass1Concept1);
dataClass2Cycle1=meanClass2Concept1+randn(1000,1)*sqrt(varianceClass2Concept1);
dataClass1Cycle2=meanClass1Concept2+randn(1000,1)*sqrt(varianceClass1Concept2);
dataClass2Cycle2=meanClass2Concept2+randn(1000,1)*sqrt(varianceClass2Concept2);
dataClass1Cycle3=meanClass1Concept1+randn(1000,1)*sqrt(varianceClass1Concept1);
dataClass2Cycle3=meanClass2Concept1+randn(1000,1)*sqrt(varianceClass2Concept1);
dataClass1Cycle4=meanClass1Concept2+randn(1000,1)*sqrt(varianceClass1Concept2);
dataClass2Cycle4=meanClass2Concept2+randn(1000,1)*sqrt(varianceClass2Concept2);
dataClass1Cycle5=meanClass1Concept1+randn(1000,1)*sqrt(varianceClass1Concept1);
dataClass2Cycle5=meanClass2Concept1+randn(1000,1)*sqrt(varianceClass2Concept1);


dataClass1Cycle1(:,2)=1;
dataClass1Cycle2(:,2)=1;
dataClass1Cycle3(:,2)=1;
dataClass1Cycle4(:,2)=1;
dataClass1Cycle5(:,2)=1;
dataClass2Cycle1(:,2)=2;
dataClass2Cycle2(:,2)=2;
dataClass2Cycle3(:,2)=2;
dataClass2Cycle4(:,2)=2;
dataClass2Cycle5(:,2)=2;


% allDataClass1=[dataClass1Concept1(:,1);dataClass1Concept2(:,1)];
% allDataClass2=[dataClass2Concept1(:,1);dataClass2Concept2(:,1)];
% [~,centers1]=hist(allDataClass1);
% [~,centers2]=hist(allDataClass2);
% 
% [t1,~]=hist(dataClass1Concept1(:,1), centers1);
% [t2,~]=hist(dataClass1Concept2(:,1), centers1);
% [t3,~]=hist(dataClass2Concept1(:,1), centers2);
% [t4,~]=hist(dataClass2Concept2(:,1), centers2);
% 
% t1=t1/sum(t1)*100;
% t2=t2/sum(t2)*100;
% t3=t3/sum(t3)*100;
% t4=t4/sum(t4)*100;
% 
% 
% f1=figure;
% set(f1, 'visible','off');
% b1=bar(centers1,t1,'FaceColor','r','EdgeColor','w');
% h1=findobj(gca,'Type','patch');
% set(h1,'facealpha',0.75);
% hold on
% b2=bar(centers1,t2,'FaceColor','b','EdgeColor','w');
% h2=findobj(gca,'Type','patch');
% set(h2,'facealpha',0.75);
% legend([b1 b2],{'Class1Concept1','Class1Concept2'});
% ylabel('Frequency');
% xlabel('Mean');
% % saveas(f1, 'Class1', 'png');
% 
% f2=figure;
% set(f2, 'visible','off');
% b3=bar(centers2,t3,'FaceColor','y','EdgeColor','w');
% h3=findobj(gca,'Type','patch');
% set(h3,'facealpha',0.75);
% hold on
% b4=bar(centers2,t4,'FaceColor','g','EdgeColor','w');
% legend([b3 b4],{'Class2Concept1','Class2Concept2'});
% ylabel('Frequency');
% xlabel('Mean');
% % saveas(f2, 'Class2', 'png');

allDataCycle1=[dataClass1Cycle1;dataClass2Cycle1];
allDataCycle2=[dataClass1Cycle2;dataClass2Cycle2];
allDataCycle3=[dataClass1Cycle3;dataClass2Cycle3];
allDataCycle4=[dataClass1Cycle4;dataClass2Cycle4];
allDataCycle5=[dataClass1Cycle5;dataClass2Cycle5];


allDataCycle1=allDataCycle1(randperm(size(allDataCycle1,1)),:);
allDataCycle2=allDataCycle2(randperm(size(allDataCycle2,1)),:);
allDataCycle3=allDataCycle3(randperm(size(allDataCycle3,1)),:);
allDataCycle4=allDataCycle4(randperm(size(allDataCycle4,1)),:);
allDataCycle5=allDataCycle5(randperm(size(allDataCycle5,1)),:);


% datasetAllConcepts=[allDataConcept12;allDataConcept22];

%PrTools format
datasetCycle1=dataset(allDataCycle1(:,1),allDataCycle1(:,2));
datasetCycle2=dataset(allDataCycle2(:,1),allDataCycle2(:,2));
datasetCycle3=dataset(allDataCycle3(:,1),allDataCycle3(:,2));
datasetCycle4=dataset(allDataCycle4(:,1),allDataCycle4(:,2));
datasetCycle5=dataset(allDataCycle5(:,1),allDataCycle5(:,2));


datasetAllCycles=[datasetCycle1;datasetCycle2;datasetCycle3;datasetCycle4;datasetCycle5];
% datasetAllConcepts=set(datasetAllConcepts,'prior',0);

% datasetAllConceptsWithLabels=datasetAllConcepts;
% vet=datasetAllConcepts.nlab;
% aux=1:size(vet,1);
% aux=aux(mod(aux,5)~=0);
% vet(aux)=NaN;
% datasetAllConcepts.nlab=vet;

