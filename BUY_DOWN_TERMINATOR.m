function []=BUY_DOWN_TERMINATOR(NO_of_rule_pool,similar_bad_buy_down)
load('RULE_POOL_BUY_DOWN.mat','RULE_POOL_BUY_DOWN');

bd_similar=0;
for rule_number1=1:NO_of_rule_pool
    kk=RULE_POOL_BUY_DOWN(6,1,rule_number1);
   % kk=kk-similar_bad_buy_down(1,2,rule_number1);
    %if kk < 0
    %  RULE_POOL_BUY_DOWN(:,:,rule_number1)=zeros(6,2);
    %  bd_similar=bd_similar+1;
   % else
        RULE_POOL_BUY_DOWN(6,1,rule_number1)=kk;
   % end
    % if kk < 0
     %   RULE_POOL_BUY_DOWN(:,:,rule_number1)=zeros(6,2);
    %end
end 
   save('RULE_POOL_BUY_DOWN.mat','RULE_POOL_BUY_DOWN');
     save('bd_similar.mat','bd_similar');
end