function[]=timeParallel(E,A,o_size,X,Y,Z,d)

%max_t = size(E,4);
max_t = 48;
for i=1:max_t-o_size+1
    beginT = i
    size = o_size
    for endT = (beginT+size-1):max_t
        endT
        size = endT - beginT +1;
        E_subs = E.subs;
        E_vals = E.vals;
        E_time = find(E_subs(:,4)>=beginT & E_subs(:,4)<=endT);
        E_subs_time = E_subs(E_time,:);
        E_vals_time = E_vals(E_time,:);
        E_subs_time(:,4) = E_subs_time(:,4)-(beginT-1);
        newE = sptensor(E_subs_time,E_vals_time,[2920 2920 4 size]);
        if nnz(newE)>=20
            break;
        end
    end
    tic;
    [SS,DD,CC,TT,GG,TD] = timeParallelGradescent(E,A,beginT,endT,size,X,Y,Z,d);
    t = toc
    TWPDA = ttensor(GG,{SS,DD,CC,TT});
    name = ['TWPDA/150 removed 2/',num2str(beginT),'.mat']
    save(name,'TWPDA','TD','t');
end
    