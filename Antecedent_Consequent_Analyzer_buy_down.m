function[kkk]=Antecedent_Consequent_Analyzer_buy_down(a,b)
kkk=1;
for i=1:5
    y=(a(i,1)==b(:,1));
    if y==zeros(5,1)
        kkk=-1;
        break;
    else
        for j=1:5
            if y(j,1)==1
               if a(i,2)~=b(j,2)
                   kkk=-1;
                   break;
               end
            end
        end
    end
end
if kkk==1
  for i=1:5
    y=(b(i,1)==a(:,1));
    if y==zeros(5,1)
        kkk=-1;
        break;
    else
        for j=1:5
            if y(j,1)==1
               if b(i,2)~=a(j,2)
                   kkk=-1;
                   break;
               end
            end
        end
    end
  end
end
end