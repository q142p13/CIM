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
a5 = 0.05;

%T = ttm(ttm(ttm(G,S,1),D,2),C,3);
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
l6 = a5/2*(norm(S)^2+norm(D)^2+norm(C)^2+norm(G)^2);

l = l1 + l2 + l3 + l4 + l6;