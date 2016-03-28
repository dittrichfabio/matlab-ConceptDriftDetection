function [interval3] = intervalIntersection(interval1,interval2)

if interval1.F<interval2.F
    if interval2.F<=interval1.L
        interval3.F=interval2.F;
        interval3.L=min(interval1.L,interval2.L);
    else
        interval3.F=NaN;
        interval3.L=NaN;
    end
else
    if interval1.F<=interval2.L
        interval3.F=interval1.F;
        interval3.L=min(interval1.L,interval2.L);
    else
        interval3.F=NaN;
        interval3.L=NaN;
    end
end