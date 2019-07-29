function [percentage_change]=PERCENTAGE_CHANGE(data)
for i=50:size(data,1)
    percentage_change(i-49,1)=(data(i,4) - data(i-1,4))/ data(i-1,4);
end
end
