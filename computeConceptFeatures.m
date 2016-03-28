function [M] = computeConceptFeatures(sequence, seqSize)

M=0;
for i=1:seqSize
    M=M+sequence(i,:);
end

M=M/seqSize;

