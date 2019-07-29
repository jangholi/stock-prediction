load('FINAL_RULE_POOL.mat','FINAL_RULE_POOL');
load('FINAL_NO.mat','FINAL_NO');
load('FINAL_MEAN_K.mat','FINAL_MEAN_K');
load('FINAL_STD_K.mat','FINAL_STD_K');
load('moving_parameter.mat','moving_parameter');
load('up.mat','up');
load('down.mat','down');
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
    %if (MA25(day,1) <= MA25(day,2) && k==1) || (MA25(day,1) > MA25(day,2) && k==4)

      %  if M(kk,2) >= (FINAL_MEAN_K(k) + .1*FINAL_STD_K(k))
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
    %else
     %   if M(kk,2) >= 2*(FINAL_MEAN_K(k) + 0.2*FINAL_STD_K(k))
          % take the action
      %     [ Portfolio,Cash,sell_price,buy_price] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price );
      % end
    %end
    
    
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