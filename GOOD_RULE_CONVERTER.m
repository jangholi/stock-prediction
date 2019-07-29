function[NO_of_rule_pool,RULE_POOL]=GOOD_RULE_CONVERTER()
load('buy_up_number1.mat','buy_up_number1');
load('buy_down_number1.mat','buy_down_number1');
load('sell_up_number1.mat','sell_up_number1');
load('sell_down_number1.mat','sell_down_number1');

load('buy_up_rule1.mat','buy_up_rule1');
load('buy_down_rule1.mat','buy_down_rule1');
load('sell_up_rule1.mat','sell_up_rule1');
load('sell_down_rule1.mat','sell_down_rule1');
NO_of_rule_pool(1,1)=buy_up_number1;
NO_of_rule_pool(2,1)=buy_down_number1;
NO_of_rule_pool(3,1)=sell_up_number1;
NO_of_rule_pool(4,1)=sell_down_number1;
for i=1:buy_up_number1
    RULE_POOL(:,:,i,1)=buy_up_rule1(:,:,i);
end
for i=1:buy_down_number1
    RULE_POOL(:,:,i,2)=buy_down_rule1(:,:,i);
end
for i=1:sell_up_number1
    RULE_POOL(:,:,i,3)=sell_up_rule1(:,:,i);
end
for i=1:sell_down_number1
    RULE_POOL(:,:,i,4)=sell_down_rule1(:,:,i);
end
end