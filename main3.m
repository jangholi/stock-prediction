clear all;
clc;
%TRADING:

% read training info
load('RULE POOL.mat','RULE_POOL');
load('NO_of_rule_pool.mat','NO_of_rule_pool');
load('period.mat','period');
load('WHOLE_INDEX','WHOLE_INDEX');

Suppression_epsilon=.1;
% terminating repeated and just-once-extracted rules.
[ RULE_POOL,NO ] = repeated_rule_terminator( RULE_POOL,NO_of_rule_pool,period);
[ RULE_POOL,NO ]  = BruteSuppression(RULE_POOL,NO,WHOLE_INDEX,Suppression_epsilon);
save('RULE POOL.mat','RULE_POOL');
save('NO.mat','NO');
% compute matchness
[ MEAN_K,STD_K ] = MATCHNESS( WHOLE_INDEX,RULE_POOL,NO );

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
k=0;
for day=1:m1
    % compute mk average matchness of a day with all rules of a class
    [ M ,k ,kk] = T_MATCH1( NO,T_INDEX,RULE_POOL,day,MEAN_K,STD_K,MA25);

    if M(kk,2) >= MEAN_K(k) + 0.1*STD_K(k)
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
    if day <=m1
        if buy_price >0 && sell_price >0
            reward_counter=reward_counter+1;
            reward(1,reward_counter)=sell_price-buy_price;
            buy_price=0;
            sell_price=0;
        end
    end
    amountof_assets(1,day)=Cash+Portfolio*data_trade(day,6);
end
save('amountof_assets.mat','amountof_assets');
save('reward.mat','reward');
PROFIT= Cash-10000000
PROFIT_RATE= PROFIT / 10000000
