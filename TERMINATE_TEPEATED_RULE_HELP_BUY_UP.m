function[]= TERMINATE_TEPEATED_RULE_HELP_BUY_UP(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD)
for rule_number1=1:NO_of_rule_pool_GOOD(1,1)
   if RULE_POOL_GOOD(1,1,rule_number1,1)> 0
     % kk=RULE_POOL_GOOD(6,1,rule_number1,1);
     kk=1;
       for i=rule_number1+1:NO_of_rule_pool_GOOD(1,1)
           if RULE_POOL_PRUNNING_HELP_BUY_UP(RULE_POOL_GOOD(1:4,:,rule_number1,1),RULE_POOL_GOOD(1:4,:,i,1))==1
              kk=kk+1;%RULE_POOL_GOOD(6,1,i,1);
              RULE_POOL_GOOD(:,:,i,1)=zeros(6,2);
           end
       end
       RULE_POOL_GOOD(6,1,rule_number1,1)=kk;
   end
end
j=0;
for i=1:NO_of_rule_pool_GOOD(1,1)
    if RULE_POOL_GOOD(1,1,i,1)> 0
       j=j+1;
       buy_up_rule1(:,:,j)= RULE_POOL_GOOD(:,:,i,1);
    end
end
buy_up_number1=j;
save('buy_up_number1.mat','buy_up_number1');
save('buy_up_rule1.mat','buy_up_rule1');
end