function [Zrec] = verifyRecurrentConcepts(F,Z,i)

Zrec=[];
for j=1:i-1
    if equivalentConcepts(F,Z,i,j)==1
        Zrec=[Zrec;Z{j}];
    end    
end