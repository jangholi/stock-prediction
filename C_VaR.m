function [ CVaR ] = C_VaR( wholedata )
[m1,m2]=size(wholedata);
    for i=51:m1
        R(i-50)= ( (wholedata(i,6)- wholedata(i-1,6))/wholedata(i-1,6) );
    end
    VaR= prctile(R,5);
    for i=1:size(R)
        if R(i) < VaR
            RR(i)=R(i);
        end
    end
    CVaR=-mean(RR);    
end