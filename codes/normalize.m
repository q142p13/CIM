function [E] = normalize(E)
%normalize 4-d tensor using atan
subs = E.subs;
for s = 1:size(subs,1)
    i = subs(s,1);
    j = subs(s,2);
    k = subs(s,3);
    t = subs(s,4);
    E(i,j,k,t)=atan(E(i,j,k,t))/pi*2;
end