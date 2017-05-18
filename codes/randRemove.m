function[A] = randRemove(origin,num)
%randomly remove some vals
A=origin;
subs = origin.subs;
vals = origin.vals;
siz = size(subs,1);
for times=1:num
    s = floor(rand()*(siz+1));
    i = subs(s,1);
    j = subs(s,2);
    k = subs(s,3);
    t = subs(s,4);
    A(i,j,k,t) = vals(s)-1;
end