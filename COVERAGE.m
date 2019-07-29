function [cover_buy_up,cover_buy_down,cover_sell_up,cover_sell_down]=COVERAGE(RULE_POOL,NO,WHOLE_INDEX)
parpool('local',2);
[m1,m2]=size(WHOLE_INDEX);

a=zeros(5,2);
a1=zeros(4,2);
cover_buy_up=zeros(m1,1,NO(1,1));
cover_buy_down=zeros(m1,1,NO(2,1));
cover_sell_up=zeros(m1,1,NO(3,1));
cover_sell_down=zeros(m1,1,NO(4,1));
    parfor i=1:NO(1,1)
        cover_buy_up(:,1,i)=COVERAGE_HELP(WHOLE_INDEX,RULE_POOL(1:4,:,i,1));
    end
    
    parfor i1=1:NO(2,1)
        cover_buy_down(:,1,i1)=COVERAGE_HELP(WHOLE_INDEX,RULE_POOL(1:4,:,i1,2));
    end
    
    
    parfor i2=1:NO(3,1)
        cover_sell_up(:,1,i2)=COVERAGE_HELP(WHOLE_INDEX,RULE_POOL(1:4,:,i2,3));
    end

    parfor i3=1:NO(4,1)
        cover_sell_down(:,1,i3)=COVERAGE_HELP(WHOLE_INDEX,RULE_POOL(1:4,:,i3,4));
    end
    delete(gcp('nocreate'));
end
            