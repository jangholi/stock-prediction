function[RULE_POOL,NO]=CONVERTER(NO_of_rule_pool_GOOD)
RULE_POOL=zeros(6,2,1,1);
load('RULE_POOL_BUY_UP.mat','RULE_POOL_BUY_UP');
load('RULE_POOL_BUY_DOWN.mat','RULE_POOL_BUY_DOWN');
load('RULE_POOL_SELL_UP.mat','RULE_POOL_SELL_UP');
load('RULE_POOL_SELL_DOWN.mat','RULE_POOL_SELL_DOWN');

mm1=0;
for i=1:NO_of_rule_pool_GOOD(1,1)
    if RULE_POOL_BUY_UP(1,1,i)>0
       mm1=mm1+1;
       RULE_POOL(:,:,mm1,1)=RULE_POOL_BUY_UP(:,:,i);
    end
end
NO(1,1)=mm1;

mm2=0;
for i=1:NO_of_rule_pool_GOOD(2,1)
    if RULE_POOL_BUY_DOWN(1,1,i)>0
       mm2=mm2+1;
       RULE_POOL(:,:,mm2,2)=RULE_POOL_BUY_DOWN(:,:,i);
    end
end
NO(2,1)=mm2;

mm3=0;
for i=1:NO_of_rule_pool_GOOD(3,1)
    if RULE_POOL_SELL_UP(1,1,i)>0
       mm3=mm3+1;
       RULE_POOL(:,:,mm3,3)=RULE_POOL_SELL_UP(:,:,i);
    end
end
NO(3,1)=mm3;

mm4=0;
for i=1:NO_of_rule_pool_GOOD(4,1)
    if RULE_POOL_SELL_DOWN(1,1,i)>0
       mm4=mm4+1;
       RULE_POOL(:,:,mm4,4)=RULE_POOL_SELL_DOWN(:,:,i);
    end
end
NO(4,1)=mm4;

end