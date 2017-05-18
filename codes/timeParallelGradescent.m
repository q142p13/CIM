function[SS,DD,CC,TT,GG,TD]=timeParallelGradescent(E,A,beginT,endT,size,X,Y,Z,d)

A_subs = A.subs;
A_vals = A.vals;
A_time = find(A_subs(:,4)>=beginT & A_subs(:,4)<=endT);
A_subs_time = A_subs(A_time,:);
A_vals_time = A_vals(A_time,:);
A_subs_time(:,4) = A_subs_time(:,4)-(beginT-1);
newA = sptensor(A_subs_time,A_vals_time,[2920 2920 4 size]);

TD = tucker_als(newA,d);
S=rand(2920,4)*(1.0e-10);
D=rand(2920,4)*(1.0e-10);
C = TD.U{3};
T = TD.U{4};
G = TD.core;

[SS,DD,CC,TT,GG] = gradescent(newA,S,D,C,T,G,X,Y,Z,d);