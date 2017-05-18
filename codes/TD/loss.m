function [l] = loss(A,S,D,C,T,G,X,Y,Z)
%calculate loss
%A:the tensor to be decomposed
%S D C : source/destination/cat latent feature matrix
%G: core tensor
%T: time dimension
%X: following relationship
%Y: user-topic 
%Z: topic-topic

a5 = 0.05;

AT = ttm(G,{S,D,C,T});

l1 = norm(A-AT)^2/2;
l6 = a5/2*(norm(S)^2+norm(D)^2+norm(C)^2+norm(G)^2);

l = l1 + l6;