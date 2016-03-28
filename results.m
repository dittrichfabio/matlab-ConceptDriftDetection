load errorOverTimeJIT4
errorArrayJ=cat(3,errorOverTimeJIT{:});
load ../A/errorOverTimeS4kd
errorArrayW=cat(3,errorOverTimeW{:});
errorArrayU=cat(3,errorOverTimeU{:});
index=setdiff(1:10000, 5:5:10000);
errorArrayJ=mean(errorArrayJ,3);
errorArrayU=mean(errorArrayU,3);
errorArrayW=mean(errorArrayW,3);
index=index(321:end)';

figure
plot(index,errorArrayJ,'-g');hold on;
plot(index(100:500:end),errorArrayJ(100:500:end),'s','MarkerFaceColor','g','MarkerEdgeColor','k');hold on;
l(1)=plot(index(1),errorArrayJ(1),'-gs','MarkerFaceColor','g','MarkerEdgeColor','k');hold on;

plot(index,errorArrayU,'-b');hold on;
plot(index(500:500:end),errorArrayU(500:500:end),'v','MarkerFaceColor','b','MarkerEdgeColor','k');hold on;
l(2)=plot(index(1),errorArrayU(1),'-bv','MarkerFaceColor','b','MarkerEdgeColor','k');hold on;

plot(index,errorArrayW,'-r','MarkerFaceColor','r');hold on;
plot(index(300:500:end),errorArrayW(300:500:end),'o','MarkerFaceColor','r','MarkerEdgeColor','k');hold on;
l(3)=plot(index(1),errorArrayW(1),'-ro','MarkerFaceColor','r','MarkerEdgeColor','k');hold on;

xlabel('Time');
ylabel('Classification Error');
title('SCALAR\_4 with dynamic k');
legend(l,'JIT Classifier','Continuous Update U','Short Memory W')




arq=dir('*mat');
n=length(arq);
all=cell(n,1);
for i=1:n
    load(arq(i).name);
    all{i}=errorOverTimeJIT;
end
errorOverTimeJIT=all;
save('../errorOverTimeJIT4.mat','errorOverTimeJIT')


hold on;
ax1 = gca;
get(ax1,'Position')
set(ax1,'XColor','k','YColor','k','YLim',[0.25,0.79]);




load errorOverTime12
errorArray1=cat(3,errorOverTimeW{:});
errorArray2=cat(3,errorOverTimeU{:});
e1=mean(errorArray1,3);
e2=mean(errorArray2,3);
mean(e1)
mean(e2)


load errorOverTimeJIT1
errorArrayJ=cat(3,errorOverTimeJIT{:});
errorArrayJ=mean(errorArrayJ,3);
mean(errorArrayJ)


