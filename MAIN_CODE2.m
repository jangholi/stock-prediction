clear all;
clc;
%TRADING:

% read training info
load('RULE POOL.mat','RULE_POOL');
load('MATCH INFO.mat','MEAN_K','STD_K');
load('NO.mat','NO');

% read the price data
data_trade= xlsread('AZARAB.xlsx','A826:F1075');
data_moving=xlsread('AZARAB.xlsx','A775:F1074');
data_indicator=xlsread('AZARAB.xlsx','A775:F1074'); 
MA25=MOVING_AVERIG(data_moving);

% Compute Indexes: function
[ T_INDEX ] = T_INDEX_COMPUTER( data_indicator );

Portfolio=0;
Cash=10000000;
[m1,m2]=size(data_trade);
reward(1,1)=0;
sell_price=0;
buy_price=0;
reward_counter=0;
for day=1:m1
    % find the target class k: function
    [ k ] = T_CLASS( MA25,day,Portfolio );
    % compute mk average matchness of a day with all rules of a class
    [ M ] = T_MATCH( NO,k,T_INDEX,RULE_POOL,day);
    % do the compare with meank and stdk
    if M >= MEAN_K(k) + 0.1*STD_K(k)
        % take the action
        [ Portfolio,Cash,sell_price,buy_price ] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price );
    end
    if day == m1
        if Portfolio > 0
           k=4;
           [ Portfolio,Cash,sell_price,buy_price ] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price );
           reward_counter=reward_counter+1;
           reward(1,reward_counter)=sell_price-buy_price;
        end
    end
    if day < m1
        if buy_price >0 && sell_price >0
            reward_counter=reward_counter+1;
            reward(1,reward_counter)=sell_price-buy_price;
            buy_price=0;
            sell_price=0;
        end
    end
end
reward
PROFIT= Cash-10000000
PROFIT_RATE= PROFIT / 10000000