function [val] = change_validation_CDTx(T,Tref,F,i,alpha)

% if T==Tref(i+1)
%     originalInterval=F(:,Tref(i)/20:Tref(i+1)/20);
%     changeInterval=F2;
% else
    originalInterval=F(:,Tref(i)/20:Tref(i+1)/20);
    changeInterval=F(:,Tref(i+1)/20+1:T/20);    
% end

n0=size(originalInterval,2);
n1=size(changeInterval,2);
p=size(originalInterval,1);

F0=mean(originalInterval,2);
F1=mean(changeInterval,2);

covF0=cov(originalInterval');
covF1=cov(changeInterval');

pooledCov=((n0-1)*covF0+(n1-1)*covF1)/(n0+n1-2);

Tsquare=(F0-F1)'*((pooledCov*(1/n0+1/n1))^-1)*(F0-F1);
F=(n0+n1-p-1)/(p*(n0+n1-2))*Tsquare;

Ftable=finv(1-alpha,p,n0+n1-p-1);

if F>Ftable %reject hypothesis that F0 and F1 are equal -> say that they are different -> change occured!
    val=1;
else %accept hypothesis -> no change occured!
    val=0;
end
