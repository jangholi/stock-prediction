function [Tn]=TREND_VALUE(data,n)
number_of_data=size(data,1);
for i=50:number_of_data
    n_period_MA=mean(data(i-n-1:i,4));
    pn=mean(data(i,1:4));
    Tn(i-49,1)=( pn - n_period_MA)/n_period_MA;
end
end