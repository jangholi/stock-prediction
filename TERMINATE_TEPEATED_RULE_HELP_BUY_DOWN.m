function[]= TERMINATE_TEPEATED_RULE_HELP_BUY_DOWN(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD)
for rule_number1=1:NO_of_rule_pool_GOOD(2,1)
   if RULE_POOL_GOOD(1,1,rule_number1,2)> 0
      %kk=RULE_POOL_GOOD(6,1,rule_number1,2);
      kk=1;
       for i=rule_number1+1:NO_of_rule_pool_GOOD(2,1)
           if RULE_POOL_PRUNNING_HELP_BUY_DOWN(RULE_POOL_GOOD(1:4,:,rule_number1,2),RULE_POOL_GOOD(1:4,:,i,2))==1
              kk=kk+1;%RULE_POOL_GOOD(6,1,i,2);
              RULE_POOL_GOOD(:,:,i,2)=zeros(6,2);
           end
       end
       RULE_POOL_GOOD(6,1,rule_number1,2)=kk;
   end
end
j=0;
for i=1:NO_of_rule_pool_GOOD(2,1)
    if RULE_POOL_GOOD(1,1,i,2)> 0
       j=j+1;
       buy_down_rule1(:,:,j)= RULE_POOL_GOOD(:,:,i,2);
    end
end
buy_down_number1=j;
save('buy_down_number1.mat','buy_down_number1');
save('buy_down_rule1.mat','buy_down_rule1');
end