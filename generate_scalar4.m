function [datasetAllConcepts] = generate_scalar4()
% function [datasetAllConcepts,datasetAllConceptsWithLabels] = generate_scalar1()

%Data generation according to Scalar_4
datasetSize=10000;
sizeClass1Concept1=datasetSize/10;
sizeClass2Concept1=datasetSize/10;

sizeClass1Concept2=datasetSize/10;
sizeClass2Concept2=datasetSize/10;

sizeClass1Concept3=datasetSize/10;
sizeClass2Concept3=datasetSize/10;

sizeClass1Concept4=datasetSize/10;
sizeClass2Concept4=datasetSize/10;

sizeClass1Concept5=datasetSize/10;
sizeClass2Concept5=datasetSize/10;



meanClass1Concept1=0;
varianceClass1Concept1=4;
meanClass2Concept1=2.5;
varianceClass2Concept1=4;

meanClass1Concept2=2;
varianceClass1Concept2=4;
meanClass2Concept2=4.5;
varianceClass2Concept2=4;

meanClass1Concept3=4;
varianceClass1Concept3=4;
meanClass2Concept3=6.5;
varianceClass2Concept3=4;

meanClass1Concept4=6;
varianceClass1Concept4=4;
meanClass2Concept4=8.5;
varianceClass2Concept4=4;

meanClass1Concept5=8;
varianceClass1Concept5=4;
meanClass2Concept5=10.5;
varianceClass2Concept5=4;


dataClass1Concept1=meanClass1Concept1+randn(sizeClass1Concept1,1)*sqrt(varianceClass1Concept1);
dataClass2Concept1=meanClass2Concept1+randn(sizeClass2Concept1,1)*sqrt(varianceClass2Concept1);

dataClass1Concept2=meanClass1Concept2+randn(sizeClass1Concept2,1)*sqrt(varianceClass1Concept2);
dataClass2Concept2=meanClass2Concept2+randn(sizeClass2Concept2,1)*sqrt(varianceClass2Concept2);

dataClass1Concept3=meanClass1Concept3+randn(sizeClass1Concept3,1)*sqrt(varianceClass1Concept3);
dataClass2Concept3=meanClass2Concept3+randn(sizeClass2Concept3,1)*sqrt(varianceClass2Concept3);

dataClass1Concept4=meanClass1Concept4+randn(sizeClass1Concept4,1)*sqrt(varianceClass1Concept4);
dataClass2Concept4=meanClass2Concept4+randn(sizeClass2Concept4,1)*sqrt(varianceClass2Concept4);

dataClass1Concept5=meanClass1Concept5+randn(sizeClass1Concept5,1)*sqrt(varianceClass1Concept5);
dataClass2Concept5=meanClass2Concept5+randn(sizeClass2Concept5,1)*sqrt(varianceClass2Concept5);

dataClass1Concept1(:,2)=1;
dataClass2Concept1(:,2)=2;

dataClass1Concept2(:,2)=1;
dataClass2Concept2(:,2)=2;

dataClass1Concept3(:,2)=1;
dataClass2Concept3(:,2)=2;

dataClass1Concept4(:,2)=1;
dataClass2Concept4(:,2)=2;

dataClass1Concept5(:,2)=1;
dataClass2Concept5(:,2)=2;

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

allDataConcept1=[dataClass1Concept1;dataClass2Concept1];
allDataConcept2=[dataClass1Concept2;dataClass2Concept2];
allDataConcept3=[dataClass1Concept3;dataClass2Concept3];
allDataConcept4=[dataClass1Concept4;dataClass2Concept4];
allDataConcept5=[dataClass1Concept5;dataClass2Concept5];

allDataConcept12=allDataConcept1(randperm(size(allDataConcept1,1)),:);
allDataConcept22=allDataConcept2(randperm(size(allDataConcept2,1)),:);
allDataConcept32=allDataConcept3(randperm(size(allDataConcept3,1)),:);
allDataConcept42=allDataConcept4(randperm(size(allDataConcept4,1)),:);
allDataConcept52=allDataConcept5(randperm(size(allDataConcept5,1)),:);

% datasetAllConcepts=[allDataConcept12;allDataConcept22];

%PrTools format
datasetConcept1=dataset(allDataConcept12(:,1),allDataConcept12(:,2));
datasetConcept2=dataset(allDataConcept22(:,1),allDataConcept22(:,2));
datasetConcept3=dataset(allDataConcept32(:,1),allDataConcept32(:,2));
datasetConcept4=dataset(allDataConcept42(:,1),allDataConcept42(:,2));
datasetConcept5=dataset(allDataConcept52(:,1),allDataConcept52(:,2));

datasetAllConcepts=[datasetConcept1; datasetConcept2; datasetConcept3; datasetConcept4; datasetConcept5];
% datasetAllConcepts=set(datasetAllConcepts,'prior',0);

% datasetAllConceptsWithLabels=datasetAllConcepts;
% vet=datasetAllConcepts.nlab;
% aux=1:size(vet,1);
% aux=aux(mod(aux,5)~=0);
% vet(aux)=NaN;
% datasetAllConcepts.nlab=vet;

