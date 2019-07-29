function ta=RAN2(j,m)
k=randperm(m);
for i=1:m
    if k(1,i) > j | k(1,i) < j && k(1,i)>1
        ta=k(1,i);
        break
    end
end
end
    