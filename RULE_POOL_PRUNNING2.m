function[ NO_of_rule_pool_GOOD,Similar_rule ] = RULE_POOL_PRUNNING2( RULE_POOL_GOOD,RULE_POOL_BAD,NO_of_rule_pool_GOOD,NO_of_rule_pool_BAD)
%parpool('local',2);
%parfor rule_number1=1:NO_of_rule_pool_GOOD(1,1)
 %   similar_bad_buy_up(1,:,rule_number1)=RULE_POOL_PRUNNING_BUY_UP(RULE_POOL_GOOD(1:4,:,rule_number1,1),RULE_POOL_BAD,NO_of_rule_pool_BAD);
%end

%similar_bad_buy_down=zeros(1,2,NO_of_rule_pool_GOOD(2,1));
%parfor rule_number2=1:NO_of_rule_pool_GOOD(2,1)
%    similar_bad_buy_down(1,:,rule_number2)=RULE_POOL_PRUNNING_BUY_DOWN(RULE_POOL_GOOD(1:4,:,rule_number2,2),RULE_POOL_BAD,NO_of_rule_pool_BAD);
%end

%parfor rule_number3=1:NO_of_rule_pool_GOOD(3,1)
 %   similar_bad_sell_up(1,:,rule_number3)=RULE_POOL_PRUNNING_SELL_UP(RULE_POOL_GOOD(1:4,:,rule_number3,3),RULE_POOL_BAD,NO_of_rule_pool_BAD);

%end

%parfor rule_number4=1:NO_of_rule_pool_GOOD(4,1)
 %  similar_bad_sell_down(1,:,rule_number4)=RULE_POOL_PRUNNING_SELL_DOWN(RULE_POOL_GOOD(1:4,:,rule_number4,4),RULE_POOL_BAD,NO_of_rule_pool_BAD);
%end
%delete(gcp('nocreate'));
RULE_POOL_BUY_UP=RULE_POOL_GOOD(:,:,:,1);
RULE_POOL_BUY_DOWN=RULE_POOL_GOOD(:,:,:,2);
RULE_POOL_SELL_UP=RULE_POOL_GOOD(:,:,:,3);
RULE_POOL_SELL_DOWN=RULE_POOL_GOOD(:,:,:,4);
save('RULE_POOL_BUY_UP.mat','RULE_POOL_BUY_UP');
save('RULE_POOL_BUY_DOWN.mat','RULE_POOL_BUY_DOWN');
save('RULE_POOL_SELL_UP.mat','RULE_POOL_SELL_UP');
save('RULE_POOL_SELL_DOWN.mat','RULE_POOL_SELL_DOWN');

similar_bad_buy_up=zeros(1,2,NO_of_rule_pool_GOOD(1,1));
similar_bad_buy_down=zeros(1,2,NO_of_rule_pool_GOOD(2,1));
similar_bad_sell_up=zeros(1,2,NO_of_rule_pool_GOOD(3,1));
similar_bad_sell_down=zeros(1,2,NO_of_rule_pool_GOOD(4,1));

parpool('local',2);
parfor ll=1:4
    if ll==1
       BUY_UP_TERMINATOR(NO_of_rule_pool_GOOD(1,1),similar_bad_buy_up);
    elseif ll==2
       BUY_DOWN_TERMINATOR(NO_of_rule_pool_GOOD(2,1),similar_bad_buy_down);
    elseif ll==3
       SELL_UP_TERMINATOR(NO_of_rule_pool_GOOD(3,1),similar_bad_sell_up);
    elseif ll==4
      SELL_DOWN_TERMINATOR(NO_of_rule_pool_GOOD(4,1),similar_bad_sell_down);
    end
end
delete(gcp('nocreate'));

load('bu_similar.mat','bu_similar');
load('bd_similar.mat','bd_similar');
load('su_similar.mat','su_similar');
load('sd_similar.mat','sd_similar');

Similar_rule=[bu_similar bd_similar su_similar sd_similar];


end