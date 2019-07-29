function []=BUY_UP_TERMINATOR(NO_of_rule_pool,similar_bad_buy_up)
load('RULE_POOL_BUY_UP.mat','RULE_POOL_BUY_UP');

bu_similar=0;
for rule_number1=1:NO_of_rule_pool
    kk=RULE_POOL_BUY_UP(6,1,rule_number1);
    %kk=kk-similar_bad_buy_up(1,2,rule_number1);
   % if kk < 0      
   %    RULE_POOL_BUY_UP(:,:,rule_number1)=zeros(6,2);
   %    bu_similar=bu_similar+1;
   % else
        RULE_POOL_BUY_UP(6,1,rule_number1)=kk;
   % end
end
 save('RULE_POOL_BUY_UP.mat','RULE_POOL_BUY_UP');
  save('bu_similar.mat','bu_similar');
end