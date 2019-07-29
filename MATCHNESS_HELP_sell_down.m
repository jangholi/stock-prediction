function[Match_kdr_sell_down]=MATCHNESS_HELP_sell_down( WHOLE_INDEX,RULE_POOL,NO,day )
%mm=0;
Match_kdr_sell_down=zeros(NO(4,1),1);
     for r=1:NO(4,1)
            Nkdr=0;
            Nkr=0;
            for i=1:4
                if RULE_POOL(i,1,r,4)==0
                    break;
                else
                    index1= WHOLE_INDEX(day,RULE_POOL(i,1,r,4));
                    Nkr=Nkr+1;
                    rslt=TABLE1(index1,RULE_POOL(i,1,r,4));
                    if RULE_POOL(i,2,r,4)==rslt
                        Nkdr=Nkdr+1;
                    end
                end
            end
            if RULE_POOL(1,1,r,4)~=0
               Match_kdr_sell_down(r,1)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,4);
             %  mm=mm+RULE_POOL(6,1,r,4);
            end
     end
    % Match_kdr_sell_down=Match_kdr_sell_down.*(1/mm);
end