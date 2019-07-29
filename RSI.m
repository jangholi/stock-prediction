function [RSI5,RSI10,RSI25]=RSI(data)
k1=size(data);
y=[5,10,24];% the period that we need
for np=1:3% use this 'for' for calculating 3 period
    n=y(1,np);% get the period 
     i=50;
    x=data(i-n+1:i,4);
    xdiff=diff(x);
    gain=abs(xdiff);
    lose=abs(xdiff);
      for j=1:numel(xdiff)
           if xdiff(j,1)<0
              gain(j,1)=0;
           end
              if xdiff(j,1)>=0
                lose(j,1)=0;
              end
      end% end of j-for
   avgain(1,1)=1/n*sum(gain(:,1));
   avlose(1,1)=1/n*sum(lose(:,1));
if avlose==0
   RSI(1,1)=100;
else
   RS(1,1)=avgain(1,1)/avlose(1,1);
   RSI(1,1)=100-(100/(1+RS(1,1)));
end
        if n==24
                n=25;
        end
for i=51:k1(1,1)
    if data(i-1,4)-data(i-2,4)>0
        k=abs(data(i-1,4)-data(i-2,4));
    else
        k=0;
    end
         avgain(i-49,1)=((avgain((i-50),1)*(n-1))+k)/n;
    if data(i-1,4)-data(i-2,4)<0
        g=abs(data(i-1,4)-data(i-2,4));
    else
        g=0;
    end
         avlose(i-49,1)=((avlose((i-50),1)*(n-1))+g)/n;
    if avlose(i-49,1)==0
       RSI(i-49,1)=100;
    else
       RS(i-49,1)=avgain(i-49,1)/avlose(i-49,1);
       RSI(i-49,1)=100-(100/(1+RS(i-49,1)));
    end
end
   if n==5
    RSI5=RSI;
   elseif n==10
    RSI10=RSI;
   else 
    RSI25=RSI;
   end

  end
end
