function [ M ] = T_MATCH( NO,k,T_INDEX,RULE_POOL,day)
Match_kdr=zeros(1,1);

        for r=1:NO(k,1)
            Nkdr=0;
            Nkr=0;
            for i=1:4
                if RULE_POOL(i,1,r,k)==0
                    break;
                else
                    index1= T_INDEX(day,RULE_POOL(i,1,r,k));
                    Nkr=Nkr+1;
                    rslt=TABLE1(index1,RULE_POOL(1,1,r,k));
                    if RULE_POOL(i,2,r,k)==rslt
                        Nkdr=Nkdr+1;
                    end
                end
            end
            Match_kdr(r,k)= Nkdr / Nkr;
        end
        M=mean(Match_kdr(:,k));
 end