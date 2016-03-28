function [F,Z] = splitConcepts(allF,F,allZ,Z,Tref,T,Tend,i)

F{i}=allF(:,Tref(i)/20:T(i)/20);
Z{i}=allZ(Tref(i)/5:T(i)/5,:);

F{i-1}=allF(:,Tref(i-1)/20:Tend(i-1)/20);

if Tref(i-1)==20
    Tref(i-1)=5;
end
Z{i-1}=allZ(Tref(i-1)/5:Tend(i-1)/5,:);