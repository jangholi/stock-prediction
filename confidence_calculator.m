function [confidence_buy_up,confidence_buy_down,confidence_sell_up,confidence_sell_down] = confidence_calculator(RULE_POOL,NO)
parpool('local',2);
confidence_buy_up=zeros(NO(1,1),2);
confidence_buy_up(:,1)=1:NO(1,1);
confidence_buy_down=zeros(NO(2,1),2);
confidence_buy_down(:,1)=1:NO(2,1);
confidence_sell_up=zeros(NO(3,1),2);
confidence_sell_up(:,1)=1:NO(3,1);
confidence_sell_down=zeros(NO(4,1),2);
confidence_sell_down(:,1)=1:NO(4,1);

    parfor i=1:NO(1,1)
        confidence_buy_up(i,2) =SUPPORT_COUNTER_buy_up(RULE_POOL(:,:,i,1),RULE_POOL(1:4,:,i,1),RULE_POOL,NO); 
    end

    parfor i=1:NO(2,1)
        confidence_buy_down(i,2) =SUPPORT_COUNTER_buy_down(RULE_POOL(:,:,i,2),RULE_POOL(1:4,:,i,2),RULE_POOL,NO); 
    end
    
    parfor i=1:NO(3,1)
        confidence_sell_up(i,2) =SUPPORT_COUNTER_sell_up(RULE_POOL(:,:,i,3),RULE_POOL(1:4,:,i,3),RULE_POOL,NO); 
    end

    
    parfor i=1:NO(4,1)
        confidence_sell_down(i,2) =SUPPORT_COUNTER_sell_down(RULE_POOL(:,:,i,4),RULE_POOL(1:4,:,i,4),RULE_POOL,NO); 
    end
     delete(gcp('nocreate'));
end


                
                
        
    

