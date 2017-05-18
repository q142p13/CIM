function [l] = loss(A,S,D,C,T,G,X,Y,Z)
%calculate loss
%A:the tensor to be decomposed
%S D C : source/destination/cat latent feature matrix
%G: core tensor
%T: time dimension
%X: following relationship
%Y: user-topic 
%Z: topic-topic

a1 = 1;
a2 = 1;
a3 = 1;
a4 = 0.2;
a5 = 0.05;

AT = ttm(G,{S,D,C,T});
l1 = norm(A-AT)^2/2;
l2 = a1/2*norm(X-S*D')^2;
l3 = a2/2*norm(Y-D*C')^2;
for i=1:size(Z,1)
    e(i)=sum(Z(i,:));
end;
E=diag(e);
LZ = E-Z;
l4 = a3/2*trace(C'*LZ*C);
dt = size(T,2);
x = ones(1,size(T,1)-1);
U = diag(x,1);
l5 = a4/2*norm(T-U*T)^2;
l6 = a5/2*(norm(S)^2+norm(D)^2+norm(C)^2+norm(G)^2);

l = l1 + l2 + l3 + l4 + l5 + l6;
