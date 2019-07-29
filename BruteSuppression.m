function [rule_pool,no] = BruteSuppression(RULE_POOL,NO,WHOLE_INDEX,Suppression_epsilon)
C=size(NO,1);
[confidence_buy_up,confidence_buy_down,confidence_sell_up,confidence_sell_down]=confidence_calculator(RULE_POOL,NO);
[cover_buy_up,cover_buy_down,cover_sell_up,cover_sell_down]=COVERAGE(RULE_POOL,NO,WHOLE_INDEX);

        confidence_buy_up=sortrows(confidence_buy_up,-2);%  sort the rows of confidence in descending order for the third column
        mn=size(confidence_buy_up);
        for kk=2:mn(1,1)
            if RULE_POOL(1,1,confidence_buy_up(kk,1),1) > 0
                if RULE_POOL(1,1,confidence_buy_up(kk-1,1),1) > 0
                    d1=union(cover_buy_up(:,1,confidence_buy_up(kk,1)),cover_buy_up(:,1,confidence_buy_up(kk-1,1)));
                    d2=intersect(cover_buy_up(:,1,confidence_buy_up(kk,1)),cover_buy_up(:,1,confidence_buy_up(kk-1,1)) );
                    if confidence_buy_up(kk,2) < (confidence_buy_up(kk-1,2) * ( (length(d2)-1) / (length(d1)-1) )) * (1+ Suppression_epsilon)
                        RULE_POOL(:,:,confidence_buy_up(kk,1),1)=0;
                        break
                    end
                end
            end
        end
        
        confidence_buy_down=sortrows(confidence_buy_down,-2);%  sort the rows of confidence in descending order for the third column
        mn=size(confidence_buy_down);
        for kk=2:mn(1,1)
            if RULE_POOL(1,1,confidence_buy_down(kk,1),2) > 0
                if RULE_POOL(1,1,confidence_buy_down(kk-1,1),2) > 0
                    d1=union(cover_buy_down(:,1,confidence_buy_down(kk,1)),cover_buy_down(:,1,confidence_buy_down(kk-1,1)));
                    d2=intersect(cover_buy_down(:,1,confidence_buy_down(kk,1)),cover_buy_down(:,1,confidence_buy_down(kk-1,1)) );
                    if confidence_buy_down(kk,2) < (confidence_buy_down(kk-1,2) * ( (length(d2)-1) / (length(d1)-1) )) * (1+ Suppression_epsilon)
                        RULE_POOL(:,:,confidence_buy_down(kk,1),2)=0;
                        break
                    end
                end
            end
        end
        
        confidence_sell_up=sortrows(confidence_sell_up,-2);%  sort the rows of confidence in descending order for the third column
        mn=size(confidence_sell_up);
        for kk=2:mn(1,1)
            if RULE_POOL(1,1,confidence_sell_up(kk,1),3) > 0
                if RULE_POOL(1,1,confidence_sell_up(kk-1,1),3) > 0
                    d1=union(cover_sell_up(:,1,confidence_sell_up(kk,1)),cover_sell_up(:,1,confidence_sell_up(kk-1,1)));
                    d2=intersect(cover_sell_up(:,1,confidence_sell_up(kk,1)),cover_sell_up(:,1,confidence_sell_up(kk-1,1)) );
                    if confidence_sell_up(kk,2) < (confidence_sell_up(kk-1,2) * ( (length(d2)-1) / (length(d1)-1) )) * (1+ Suppression_epsilon)
                        RULE_POOL(:,:,confidence_sell_up(kk,1),3)=0;
                        break
                    end
                end
            end
        end
        
        confidence_sell_down=sortrows(confidence_sell_down,-2);%  sort the rows of confidence in descending order for the third column
        mn=size(confidence_sell_down);
        for kk=2:mn(1,1)
            if RULE_POOL(1,1,confidence_sell_down(kk,1),4) > 0
                if RULE_POOL(1,1,confidence_sell_down(kk-1,1),4) > 0
                    d1=union(cover_sell_down(:,1,confidence_sell_down(kk,1)),cover_sell_down(:,1,confidence_sell_down(kk-1,1)));
                    d2=intersect(cover_sell_down(:,1,confidence_sell_down(kk,1)),cover_sell_down(:,1,confidence_sell_down(kk-1,1)) );
                    if confidence_sell_down(kk,2) < (confidence_sell_down(kk-1,2) * ( (length(d2)-1) / (length(d1)-1) )) * (1+ Suppression_epsilon)
                        RULE_POOL(:,:,confidence_sell_down(kk,1),4)=0;
                        break
                    end
                end
            end
        end
% creat new rule pool that is not include zero rule
for c=1:C
    m=0;
    for i=1:NO(c,1)
        if RULE_POOL(1,1,i,c)>0
            m=m+1;
            rule_pool(:,:,m,c)=RULE_POOL(:,:,i,c);
        end
    end
    no(c,1)=m;
end
end