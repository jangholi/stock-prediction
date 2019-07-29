function ind=TEST_TREND(data_indicator,moving_parameter)
load('bb.mat','bb');
m=bb;
X = [TREND_VALUE(data_indicator,moving_parameter) PERCENTAGE_CHANGE(data_indicator)];
 % Calculate Distance Matrix
    d = pdist2(X, m);
    
    % Assign Clusters and Find Closest Distances
    [dmin, ind] = min(d, [], 2);
end
    
