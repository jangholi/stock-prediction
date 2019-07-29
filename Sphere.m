function z=Sphere(x)
   eta1=x(1,1);
   eta2=x(1,2);
   % z=sum(x.^2);

load('FINAL_RULE_POOL.mat','FINAL_RULE_POOL');
load('FINAL_NO.mat','FINAL_NO');
load('FINAL_MEAN_K.mat','FINAL_MEAN_K');
load('FINAL_STD_K.mat','FINAL_STD_K');
load('moving_parameter.mat','moving_parameter');
% read the price data
data_trade= xlsread('AKHABER.xlsx','A826:F1075');
data_moving=xlsread('AKHABER.xlsx','A775:F1074');
data_indicator=xlsread('AKHABER.xlsx','A775:F1074'); 
MA25=TEST_TREND(data_moving,moving_parameter);

% Compute Indexes: function
[ T_INDEX ] = T_INDEX_COMPUTER( data_indicator );

Portfolio=0;
Cash=10000000;
m1=size(data_trade,1);
sell_price=0;
buy_price=0;

for day=1:m1
    % compute mk average matchness of a day with all rules of a class
    [ M , k , kk] = T_MATCH2( FINAL_NO,T_INDEX,FINAL_RULE_POOL,day,FINAL_MEAN_K,FINAL_STD_K,MA25,eta1);
        if M(kk,2) >= (FINAL_MEAN_K(k) + eta2*FINAL_STD_K(k))
           % tke the action
           [ Portfolio,Cash,sell_price,buy_price] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price );
           
        end
    if day == m1
        if Portfolio > 0
           k=4;
           [ Portfolio,Cash,sell_price,buy_price] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price );
        end
    end
    if day <= m1
        if buy_price >0 && sell_price >0
            buy_price=0;
            sell_price=0;
        end
    end
end
PROFIT= Cash-10000000;
z=-PROFIT;
end