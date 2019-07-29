function []=SELL_UP_TERMINATOR(NO_of_rule_pool,similar_bad_sell_up)
load('RULE_POOL_SELL_UP.mat','RULE_POOL_SELL_UP');

su_similar=0;
for rule_number1=1:NO_of_rule_pool
    kk=RULE_POOL_SELL_UP(6,1,rule_number1);
        RULE_POOL_SELL_UP(6,1,rule_number1)=kk;
end
  save('RULE_POOL_SELL_UP.mat','RULE_POOL_SELL_UP');
   save('su_similar.mat','su_similar');
end