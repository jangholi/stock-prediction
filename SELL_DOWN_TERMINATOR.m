function []=SELL_DOWN_TERMINATOR(NO_of_rule_pool,similar_bad_sell_down)
load('RULE_POOL_SELL_DOWN.mat','RULE_POOL_SELL_DOWN');

sd_similar=0;
for rule_number1=1:NO_of_rule_pool
    kk=RULE_POOL_SELL_DOWN(6,1,rule_number1);

        RULE_POOL_SELL_DOWN(6,1,rule_number1)=kk;

end
  save('RULE_POOL_SELL_DOWN.mat','RULE_POOL_SELL_DOWN');
   save('sd_similar.mat','sd_similar');
end