function[rmse] = RMSE(E,A,AA)
%calculate RMSE over removed points
%E:the origin tensor
%A:the tensor removed some points
%AA:the reconstructed tensor
DIFF = E-A;
DIFF_subs = DIFF.subs;
reTensor = tensor(AA);
lossPoints = E(DIFF_subs);
rePoints = reTensor(DIFF_subs);
rmse = sqrt(sum((lossPoints-rePoints).^2)/size(DIFF_subs,1));