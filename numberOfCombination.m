function [c] = numberOfCombination(n,m)

c=factorial(n)/(factorial(m)*factorial(n-m));