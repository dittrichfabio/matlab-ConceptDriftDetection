addpath(genpath('../scripts/PrToolBox/'));

% matlabpool(8);
tic
vE=20;ME=4;
vX=20;MX=4;
gamma=2;
gammaref=2;
lambda=1.5;
alpha=0.1;
inputSpaceSize=1;

nReplications=1;
errorOverTimeJIT=cell(nReplications,1);
% errorOverTimeW=cell(nReplications,1);
T=cell(nReplications,1);
Tref=cell(nReplications,1);
Tend=cell(nReplications,1);
% savedK=cell(nReplications,1);
% savedKLOO=cell(nReplications,1);
for R=1:nReplications
    prwarning(0);
    fprintf(1,'R%d\n',R);
    %Create dataset Scalar1
    [data] = generate_scalar1();

    initialTrainingSequence=data(1:400,:);

    [Z,F,P,TS0,VS0,h0,K0,K,k,~,~]=buildInitialConcept(initialTrainingSequence, vE, vX);
    allF=F{1};
    allZ=Z{1};
    kLOO=k;
    n=size(Z{1},1);
    deltaN=0;
    numTrainSeqX=size(initialTrainingSequence,1)/vX;
    [confX]=configureCDTx(F{1},numTrainSeqX,gamma);
    configured=1;
    Tref{R}(1)=20;
    T{R}(1)=size(initialTrainingSequence,1);
    numTrainSeqE=size(initialTrainingSequence(5:5:end),1)/vE-1;
    [confE]=configureCDTe(P{1},numTrainSeqE,gamma);

    index=setdiff(1:400,5:5:400);
    classificationLabelsJIT=zeros(size(data,1)*0.8,1);
    classificationLabelsJIT(1:320)=data(index,:)*K*labeld;
%     classificationLabelsW=zeros(size(data,1)*0.8,1);
%     classificationLabelsW(1:320)=data(index,:)*W*labeld;
    errorOverTimeJIT{R}=zeros(7680,1);
%     errorOverTimeW{R}=zeros(7680,1);
%     savedK{R}=zeros(1921,1);
%     savedKLOO{R}=zeros(1921,1);
%     sk=1;
%     savedK{R}(1)=savedK{R}(1)+k;
%     savedKLOO{R}(1)=savedKLOO{R}(1)+k;

    x=0;e=0;idxError=0;idxClassification=320;
    timeSupervised=0;timeComputeF=0;timeChange=0;timeReconfigure=0;timeClassification=0;
    QX=zeros(vX,1);QE=zeros(vE,2);
    rX=0;rE=0;
    reconfigure=0;
    i=1; j=401;
    
    while j<=size(data,1)
        x=x+1;
        QX(x)=data(j,1);
        if mod(j,5)==0
            Z{i}(end+1,:)=data(j,:);
            allZ(end+1,:)=data(j,:);
            %k=updateK();%%%%%%%%%%%%%%%%%%%%%%%%%%
            deltaN=deltaN+1;
            if (deltaN/n>=0.25)
                [~,kLOO]=knnc(Z{i});
%                 [~,kW]=knnc(Z{i}(end-39:end,:));
                n=size(Z{i},1);
                deltaN=0;
            end
            k=round(kLOO*((n+deltaN)/n)^(4/(inputSpaceSize+4)));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             sk=sk+1;
%             savedK{R}(sk)=savedK{R}(sk)+k;
%             [~,mykLOO]=knnc(Z{1});
%             savedKLOO{R}(sk)=savedKLOO{R}(sk)+mykLOO;
            K=knnc(Z{i},k);
%             W=knnc(Z{i}(end-39:end,:),kW);
            
            e=e+1;
            QE(e,1)=data(j);
            QE(e,2)=data.nlab(j);
            if (e==vE)
%                 P{i}(end+1)=estimateClassificationErrorP(dataset(QE(:,1),QE(:,2)),K0);
%                 if configured==1
%                     [rE,confE]=CDTe(P{i}(end),confE,numTrainSeqE,gamma);
%                 end
                QE=zeros(vE,2);
                e=0;
            end
        end
        if (x==vX)
            [M,V]=computeMV(QX, h0, vX);
            F{i}(1,end+1)=M;
            F{i}(2,end)=V;
            allF(1,end+1)=M;
            allF(2,end)=V;
            if configured==1
                 [rX,confX]=CDTx(M,V,confX,numTrainSeqX,gamma);
            end
            if (rX==1)
                [rX,Tref{R}(i+1),T{R}(i+1)]=refinementProcedure(j,lambda,gammaref,vX,h0,T{R}(i),confX,numTrainSeqX,data);
                if (rX==1)
%                     m=j+1;
%                     F2=zeros(2,5);
%                     for v=1:5
%                         QX=data(m:m+vX-1,1);
%                         [M,V]=computeMV(QX, h0, vX);
%                         F2(1,v)=M;
%                         F2(2,v)=V;
%                         m=m+vX;
%                     end
                    rX=change_validation_CDTx(j,Tref{R},allF,i,alpha);
                end
                if (rX==0)
                    F2=allF(:,Tref{R}(i)/20:T{R}(i)/20);
                    numTrainSeqX=size(F2,2);
                    [confX]=configureCDTx(F2,numTrainSeqX,gamma);
%                     F{i}=F{i}(:,Tref{R}(i)/20:T{R}(i)/20);
                end
            end
            QX=zeros(vX,1);
            x=0;
        end
        if (rX==1 || rE==1)
            i=i+1;
            F2=allF(:,Tref{R}(i)/20:T{R}(i)/20);
            numTrainSeqX=size(F2,2);
            [confEnd]=configureCDTx(F2,numTrainSeqX,gamma);
            Tend{R}(i-1)=computeTend(data,confEnd,Tref{R}(i),Tref{R}(i-1),numTrainSeqX,vX,h0,gamma);
            [F,Z]=splitConcepts(allF,F,allZ,Z,Tref{R},T{R},Tend{R},i);
            [K,k]=knnc(Z{i});
            kLOO=k;
%             if size(Z{i},1)<40
%                 W=K;
%                 kW=k;
%             else
%                 [W,kW]=knnc(Z{i}(end-39:end,:));
%             end
            reconfigure=1;
            configured=0;
            rX=0;
        end
        if (reconfigure==1 && size(F{i},2)>=2*MX) % && size(P{i},2)>=ME)
    %         More stuff
            numTrainSeqX=size(F{i},2);
            [confX]=configureCDTx(F{i},numTrainSeqX,gamma);
            configured=1;
            
%             numberSupervisedSamples=size(Z{i},1);
%             numberForTraining=numberSupervisedSamples-vE;
%             TS0=Z{i}(1:numberForTraining,:);
%             VS0=Z{i}(numberForTraining+1:end,:);
%             K0=knnc(TS0);
            %compute Pi and configure CDTe
            
            [Zrec]=verifyRecurrentConcepts(F,Z,i);
            Z{i}=[Z{i};Zrec];
            [K]=knnc(Z{i},k);
            reconfigure=0;
        end
        if mod(j,5)~=0
            idxClassification=idxClassification+1;
            classificationLabelsJIT(idxClassification)=data(j,:)*K*labeld;
%             classificationLabelsW(idxClassification)=data(j,:)*W*labeld;
            index=setdiff(1:j, 5:5:j);
            groundTruthLabels=data.nlab(index);
            idxError=idxError+1;
            errorOverTimeJIT{R}(idxError)=1-sum(classificationLabelsJIT(idxClassification-39:idxClassification)==groundTruthLabels(end-39:end))/40;
%             errorOverTimeW{R}(idxError)=1-sum(classificationLabelsW(idxClassification-39:idxClassification)==groundTruthLabels(end-39:end))/40;

        end
        fprintf(1,'%d\n',j);
%         fprintf(1,'%d P:%f %f %f\n',j,P{i}(end),confE.interval(end).F,confE.interval(end).L);
        j=j+1;
    end

end
toc
save('errorOverTimeJIT', 'errorOverTimeJIT');
% save('savedK','savedK','savedKLOO');

% figure;
% plot(index(321:end)',mean(errorOverTime,2));

% ax1 = gca;
% get(ax1,'Position');
% set(ax1,'XColor','k','YColor','k','XLim',[0,10000],'YLim',[0,1]);
% toc
