function ta=RAN(j,m)
k=randperm(m);
for i=1:m
    if k(1,i) > j | k(1,i) < j
        ta=k(1,i);
        break
    end
end
end
    