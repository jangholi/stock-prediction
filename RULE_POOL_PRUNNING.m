function[ RULE_POOL_GOOD,NO_of_rule_pool_GOOD,Similar_rule ] = RULE_POOL_PRUNNING( RULE_POOL_GOOD,RULE_POOL_BAD,NO_of_rule_pool_GOOD,NO_of_rule_pool_BAD)
parpool('local',2);
parfor rule_number1=1:NO_of_rule_pool_GOOD(1,1)
    similar_bad_buy_up(1,:,rule_number1)=RULE_POOL_PRUNNING_BUY_UP(RULE_POOL_GOOD(1:4,:,rule_number1,1),RULE_POOL_BAD,NO_of_rule_pool_BAD);
end

similar_bad_buy_down=zeros(1,2,NO_of_rule_pool_GOOD(2,1));
parfor rule_number2=1:NO_of_rule_pool_GOOD(2,1)
    similar_bad_buy_down(1,:,rule_number2)=RULE_POOL_PRUNNING_BUY_DOWN(RULE_POOL_GOOD(1:4,:,rule_number2,2),RULE_POOL_BAD,NO_of_rule_pool_BAD);
end

parfor rule_number3=1:NO_of_rule_pool_GOOD(3,1)
    similar_bad_sell_up(1,:,rule_number3)=RULE_POOL_PRUNNING_SELL_UP(RULE_POOL_GOOD(1:4,:,rule_number3,3),RULE_POOL_BAD,NO_of_rule_pool_BAD);

end

parfor rule_number4=1:NO_of_rule_pool_GOOD(4,1)
   similar_bad_sell_down(1,:,rule_number4)=RULE_POOL_PRUNNING_SELL_DOWN(RULE_POOL_GOOD(1:4,:,rule_number4,4),RULE_POOL_BAD,NO_of_rule_pool_BAD);
end
bu_similar=0;
for rule_number1=1:NO_of_rule_pool_GOOD(1,1)
    kk=RULE_POOL_GOOD(6,1,rule_number1,1);
    if RULE_POOL_GOOD(1,1,rule_number1,1)> 0
       for i=rule_number1+1:NO_of_rule_pool_GOOD(1,1)
           if RULE_POOL_PRUNNING_HELP_BUY_UP(RULE_POOL_GOOD(1:4,:,rule_number1,1),RULE_POOL_GOOD(1:4,:,i,1))==1
              if kk < RULE_POOL_GOOD(6,1,i,1)
                 kk=RULE_POOL_GOOD(6,1,i,1);
              end
              RULE_POOL_GOOD(:,:,i,1)=zeros(6,2);
           end
       end
    end
    kk=kk+similar_bad_buy_up(1,2,rule_number1);
    if similar_bad_buy_up(1,1,rule_number1)~=0      
       RULE_POOL_GOOD(6,1,rule_number1,1)=kk/2;
       bu_similar=bu_similar+1;
    else
        RULE_POOL_GOOD(6,1,rule_number1,1)=kk;
    end
    if kk < 0
        RULE_POOL_GOOD(:,:,rule_number1,1)=zeros(6,2);
    end
end
bd_similar=0;
for rule_number1=1:NO_of_rule_pool_GOOD(2,1)
    kk=RULE_POOL_GOOD(6,1,rule_number1,2);
    if RULE_POOL_GOOD(1,1,rule_number1,2)> 0
       for i=rule_number1+1:NO_of_rule_pool_GOOD(2,1)
           if RULE_POOL_PRUNNING_HELP_BUY_DOWN(RULE_POOL_GOOD(1:4,:,rule_number1,2),RULE_POOL_GOOD(1:4,:,i,2))==1
               if kk < RULE_POOL_GOOD(6,1,i,2)
                  kk=RULE_POOL_GOOD(6,1,i,2);
               end
              RULE_POOL_GOOD(:,:,i,2)=zeros(6,2);
           end
       end
    end
    kk=kk+similar_bad_buy_down(1,2,rule_number1);
    if similar_bad_buy_down(1,1,rule_number1)~=0
       RULE_POOL_GOOD(6,1,rule_number1,2)=kk/2;
       bd_similar=bd_similar+1;
    else
        RULE_POOL_GOOD(6,1,rule_number1,2)=kk;
    end
     if kk < 0
        RULE_POOL_GOOD(:,:,rule_number1,2)=zeros(6,2);
    end
end
su_similar=0;
for rule_number1=1:NO_of_rule_pool_GOOD(3,1)
    kk=RULE_POOL_GOOD(6,1,rule_number1,3);
    if RULE_POOL_GOOD(1,1,rule_number1,3)>0
       for i=rule_number1+1:NO_of_rule_pool_GOOD(3,1)
           if RULE_POOL_PRUNNING_HELP_SELL_UP(RULE_POOL_GOOD(1:4,:,rule_number1,3),RULE_POOL_GOOD(1:4,:,i,3))==1
               if kk < RULE_POOL_GOOD(6,1,i,3)
                  kk=RULE_POOL_GOOD(6,1,i,3);
               end
              RULE_POOL_GOOD(:,:,i,3)=zeros(6,2);
           end
       end
    end
    kk=kk+similar_bad_sell_up(1,2,rule_number1);
    if similar_bad_sell_up(1,1,rule_number1)~=0
       RULE_POOL_GOOD(6,1,rule_number1,3)=kk/2;
       su_similar=su_similar+1;
    else
        RULE_POOL_GOOD(6,1,rule_number1,3)=kk;
    end
    if kk < 0
       RULE_POOL_GOOD(:,:,rule_number1,3)=zeros(6,2);
    end
end
sd_similar=0;
for rule_number1=1:NO_of_rule_pool_GOOD(4,1)
    kk=RULE_POOL_GOOD(6,1,rule_number1,4);
    if RULE_POOL_GOOD(1,1,rule_number1,4)> 0
       for i=rule_number1+1:NO_of_rule_pool_GOOD(4,1)
           if RULE_POOL_PRUNNING_HELP_SELL_DOWN(RULE_POOL_GOOD(1:4,:,rule_number1,4),RULE_POOL_GOOD(1:4,:,i,4))==1
              if kk < RULE_POOL_GOOD(6,1,i,4)
                 kk=RULE_POOL_GOOD(6,1,i,4);
              end
              RULE_POOL_GOOD(:,:,i,4)=zeros(6,2);
           end
       end
    end
    kk=kk+similar_bad_sell_down(1,2,rule_number1);
    if similar_bad_sell_down(1,1,rule_number1)~=0
       RULE_POOL_GOOD(6,1,rule_number1,4)=kk/2;
       sd_similar=sd_similar+1;
    else
        RULE_POOL_GOOD(6,1,rule_number1,4)=kk;
    end
    if kk < 0
        RULE_POOL_GOOD(:,:,rule_number1,4)=zeros(6,2);
    end
end
Similar_rule=[bu_similar bd_similar su_similar sd_similar];
delete(gcp('nocreate'));

end