function [res] = readTWPDA(fodername)
%read the mats in fodername
i = 1;
for i=1:48
    name = [fodername,num2str(i),'.mat'];
    if exist(name,'file')>0
        res(i) = load(name);
        %length = size(res(i).TWPDA,4);
    end
end