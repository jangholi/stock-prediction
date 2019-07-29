function [RCI5,RCI10,RCI25]=RCI(data)
y=[5,10,25];

for np=1:3
    n=y(1,np);
    [m1,m2]=size(data);
    for i=50:m1
          for j=1:n
              temp(j,1)=j;
              temp(j,2)=data(i-j+1,4);
          end
    
    temp2=sortrows(temp,2);
    
    for j=1:n
        temp2(j,2)=j;
    end
    RCI(i-49,1)=corr(temp2(:,1),temp2(:,2));
    end

    if n==5
        RCI5=RCI;
    elseif n==10
        RCI10=RCI;
    else
        RCI25=RCI;
    end
end
end
