function MA=MOVING_AVERIG(data)
m=size(data);
for i=50:m(1,1)
    MA(i-49,1)=mean(data(i-49:i-25,4));
    MA(i-49,2)=mean(data(i-24:i,4));
end
end
    
   