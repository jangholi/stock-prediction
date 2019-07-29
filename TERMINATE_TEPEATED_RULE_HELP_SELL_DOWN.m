function[]= TERMINATE_TEPEATED_RULE_HELP_SELL_DOWN(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD)
for rule_number1=1:NO_of_rule_pool_GOOD(4,1)
   if RULE_POOL_GOOD(1,1,rule_number1,4)> 0
     % kk=RULE_POOL_GOOD(6,1,rule_number1,4);
     kk=1;
       for i=rule_number1+1:NO_of_rule_pool_GOOD(4,1)
           if RULE_POOL_PRUNNING_HELP_SELL_DOWN(RULE_POOL_GOOD(1:4,:,rule_number1,4),RULE_POOL_GOOD(1:4,:,i,4))==1
              kk=kk+1;%RULE_POOL_GOOD(6,1,i,4);
              RULE_POOL_GOOD(:,:,i,4)=zeros(6,2);
           end
       end
       RULE_POOL_GOOD(6,1,rule_number1,4)=kk;
   end
end
j=0;
for i=1:NO_of_rule_pool_GOOD(4,1)
    if RULE_POOL_GOOD(1,1,i,4)> 0
       j=j+1;
       sell_down_rule1(:,:,j)= RULE_POOL_GOOD(:,:,i,4);
    end
end
sell_down_number1=j;
save('sell_down_number1.mat','sell_down_number1');
save('sell_down_rule1.mat','sell_down_rule1');
end