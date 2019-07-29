clear all;
clc;
%TRADING:

% read training info
load('RULE POOL GOOD.mat','RULE_POOL_GOOD');
load('RULE POOL BAD.mat','RULE_POOL_BAD');
load('NO_of_rule_pool_GOOD.mat','NO_of_rule_pool_GOOD');
load('NO_of_rule_pool_BAD.mat','NO_of_rule_pool_BAD');
load('WHOLE_INDEX','WHOLE_INDEX');
load('moving_parameter.mat','moving_parameter');
load('up.mat','up');
load('down.mat','down');
%rule terminating
TERMINATE_TEPEATED_RULE(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD);
[NO_of_rule_pool_GOOD,RULE_POOL_GOOD]=GOOD_RULE_CONVERTER();
[NO_of_rule_pool_GOOD ,Similar_rule] = RULE_POOL_PRUNNING2( RULE_POOL_GOOD,RULE_POOL_BAD,NO_of_rule_pool_GOOD,NO_of_rule_pool_BAD);
[RULE_POOL,NO]=CONVERTER(NO_of_rule_pool_GOOD);
FINAL_RULE_POOL=RULE_POOL;
FINAL_NO=NO;
save('FINAL_RULE_POOL','FINAL_RULE_POOL');
save('FINAL_NO','FINAL_NO');
% compute matchness
[ MEAN_K,STD_K ] = MATCHNESS( WHOLE_INDEX,RULE_POOL,NO );
FINAL_MEAN_K=MEAN_K;
FINAL_STD_K=STD_K;
save('FINAL_MEAN_K','FINAL_MEAN_K');
save('FINAL_STD_K','FINAL_STD_K');
% read the price data
data_trade= xlsread('KHODRO.xlsx','A801:F1050');
data_moving=xlsread('KHODRO.xlsx','A750:F1049');
data_indicator=xlsread('KHODRO.xlsx','A750:F1049'); 
MA25=TEST_TREND(data_moving,moving_parameter);

% Compute Indexes: function
[ T_INDEX ] = T_INDEX_COMPUTER( data_indicator );

Portfolio=0;
Cash=10000000;
[m1,m2]=size(data_trade);
amountof_assets=zeros(1,m1);
reward(1,1)=0;
sell_price=0;
buy_price=0;
reward_counter=0;
k=0;
tn=1;

for day=1:m1
    % compute mk average matchness of a day with all rules of a class
    [ M , k , kk] =  T_MATCH3( FINAL_NO,T_INDEX,FINAL_RULE_POOL,day,FINAL_MEAN_K,FINAL_STD_K,MA25,Portfolio,up);
        if k~=0
           % tke the action
           [ Portfolio,Cash,sell_price,buy_price] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price );
        else
            k;
        end

        if Portfolio>0
            share=Portfolio;
            day;
        end
    if day == m1
        if Portfolio > 0
           k=4;
           
           [ Portfolio,Cash,sell_price,buy_price] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price );
           reward_counter=reward_counter+1;
           reward(1,reward_counter)=(sell_price-buy_price)*share;
           share=0;
        end
    end
    if day <= m1
        if buy_price >0 && sell_price >0
            reward_counter=reward_counter+1;
            reward(1,reward_counter)=(sell_price-buy_price)*share;
            buy_price=0;
            sell_price=0;
            share=0;
        end
    end
    amountof_assets(1,day)=Cash+Portfolio*data_trade(day,6);
end
save('amountof_assets.mat','amountof_assets');
save('reward.mat','reward');
PROFIT= Cash-10000000
PROFIT_RATE= PROFIT / 10000000
save('PROFIT.mat','PROFIT');
save('PROFIT_RATE.mat','PROFIT_RATE');