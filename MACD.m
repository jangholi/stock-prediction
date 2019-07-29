function [MAC]=MACD(data)
[m1,m2]=size(data);
EMA5(1)=mean(data(36:40,4)); 
for i=41:m1
     EMA5(i-39)= (data(i-1,4)*(2/6))+EMA5(i-40)*(1-(2/6));
end
EMA25(1)= mean(data(16:40,4));
for i=41:m1
    EMA25(i-39)= ( data(i-1,4) * (2/26) ) + (EMA25(i-40) * (1-(2/26)));
end
for i=1:length(EMA5)
    macd(i)=EMA5(i)-EMA25(i);
end
signal(1)=mean(macd(1:9));
for i=10:length(macd)
    signal(i-8)= (macd(i) * .2)+(signal(i-9) * .8);
end
MAC(1,1)=3;
for i=10:length(macd)
    MAC(i-9,1)=3;
    if macd(i) > signal(i-8)
        if macd(i-1) <= signal(i-9)
            MAC(i-9,1)=1;
        end
    elseif macd(i) < signal(i-8)
        if macd(i-1) >= signal(i-9)
            MAC(i-9,1)=2;
        end
    end
end
MAC=MAC(2:end,1);
end
    