function[prec,rePoints] = precision(E,A,AA,threshold)
%calculate the precision
%E:the origin tensor
%A:the tensor removed some points
%AA:the reconstructed tensor
%threshold:threshold value of positive
DIFF = E-A;
DIFF_subs = DIFF.subs;
reTensor = tensor(AA);
rePoints = reTensor(DIFF_subs);
n = size(DIFF_subs,1);
p = find(rePoints>threshold);
pn = size(p,1);
prec = pn/n;