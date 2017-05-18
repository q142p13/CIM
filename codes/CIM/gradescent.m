function [S,D,C,T,G] = gradescent(A,S,D,C,T,G,X,Y,Z,d)
steps = 10000;
yita = 0.001;
a1 = 1;
a2 = 1;
a3 = 1;
a4 = 0.2;
a5 = 0.05;
x = 0.01;
for i=1:size(Z,1)
    e(i)=sum(Z(i,:));
end;
E=diag(e);
LZ = E-Z;
ux = ones(1,size(T,1)-1);
U = diag(ux,1);
I = eye(size(T,1));

subs = A.subs;
len = nnz(A);
l1 = loss(A,S,D,C,T,G,X,Y,Z)
for step=1:steps

    for sub=1:len
        i = subs(sub,1);
        j = subs(sub,2);
        k = subs(sub,3);
        t = subs(sub,4);

        b = ttm(ttm(ttm(ttm(G,S(i,:),1),D(j,:),2),C(k,:),3),T(t,:),4);
        S(i,:) = S(i,:) - yita * a5 * S(i,:) - yita * a1 * (S(i,:)*D'-X(i,:)) * D - yita * (b.data - A(i,j,k,t)) * permute(ttm(ttm(ttm(G,D(j,:),2),C(k,:),3),T(t,:),4),[2 1 3 4]);
        D(j,:) = D(j,:) - yita * a5 * D(j,:) - yita * a1 * (S*D(j,:)'-X(:,j))' * S -yita * a2 * (D(j,:)*C'-Y(j,:)) * C - yita * (b.data - A(i,j,k,t)) * ttm(ttm(ttm(G,S(i,:),1),C(k,:),3),T(t,:),4);
        LZC = LZ*C;
        C(k,:) = C(k,:) - yita * a5 * C(k,:) - yita * a2 *(D*C(k,:)'-Y(:,k))' * D - yita * a3 * LZC(k,:) - yita * (b.data - A(i,j,k,t)) * permute(ttm(ttm(ttm(G,S(i,:),1),D(j,:),2),T(t,:),4),[1 3 2 4]);
        T(t,:) = T(t,:) - yita * a5 * T(t,:) - yita * a4 * (I(t,:)-U(t,:)) * (I(t,:)' * T(t,:)-U(t,:)'*T(t,:)) - yita * (b.data - A(i,j,k,t)) * permute(ttm(ttm(ttm(G,S(i,:),1),D(j,:),2),C(k,:),3),[1 4 3 2]);
        G = G - yita * a5 * G - yita *  (b.data - A(i,j,k,t)) * ttt(ttt(ttt(tensor(S(i,:),d),tensor(D(j,:),d)),tensor(C(k,:),d)),tensor(T(t,:),d));
    end;

    l2 = loss(A,S,D,C,T,G,X,Y,Z)
    
    save('SS.mat','S');
    save('DD.mat','D');
    save('CC.mat','C');
    save('TT.mat','T');
    save('GG.mat','G');
    
    if abs(l1-l2)<x
        step
        break;
    end;
    l1 = l2;
end;
