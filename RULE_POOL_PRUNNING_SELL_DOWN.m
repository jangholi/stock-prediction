function[mm]=RULE_POOL_PRUNNING_SELL_DOWN(a,RULE_POOL_BAD,NO_of_rule_pool_BAD)
mm=zeros(1,2);
kk=0;
for i=1:NO_of_rule_pool_BAD(4,1)
    if RULE_POOL_PRUNNING_HELP_SELL_DOWN(a,RULE_POOL_BAD(1:4,:,i,4))==1
        kk=kk+1;
        mm(1,2)=mm(1,2)+1;%RULE_POOL_BAD(6,1,i,4);
    end
end
mm(1,1)=kk;
end