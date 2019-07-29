function v2=DIFFERENCE(CD3,V3)
% bring us places that both CD3 and V3 are different
v1=find(ismember(CD3,V3));
for i=1:length(v1)
    CD3(1,v1(1,i))=0;
end
v2=find(CD3>0);

end