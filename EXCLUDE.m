function CD=EXCLUDE(CD3,V3)
v1=find(ismember(CD3,V3));
for i=1:length(v1)
    CD3(1,v1(1,i))=0;
end
v2=find(CD3>0);
for i=1:length(v2)
    CD(1,i)=CD3(1,v2(1,i));
end
end