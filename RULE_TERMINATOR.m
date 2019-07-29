function [ RULE1,NO1 ] = RULE_TERMINATOR( RULE_POOL,NO,period)
[C,C1,C2]=size(NO);
%%%at first we remove rule in every period thet is extracted more than one 
  for c=1:C    %each class(sell-up,sell-down,buy-up.buy-down)
    for per=1:period   
        for i=1:NO(c,1,per)
           for j=i+1:NO(c,1,per)
              if RULE_POOL(:,:,i,c,per) == RULE_POOL(:,:,j,c,per)
                 RULE_POOL(:,:,j,c,per)=0;
              end
           end
        end
        m=1;
        for i=1:NO(c,1,per)
            if RULE_POOL(1,1,i,c,per) > 0
                RULE(:,:,m,c,per)=RULE_POOL(:,:,i,c,per);
                m=m+1;
            end
        end
        NO(c,1,per)=m-1;
    end
  end
  % now we remove period from rule pool
      for c=1:C
        m=1;
        for per=1:period
          for i=1:NO(c,1,per)
            RULE_pool(:,:,m,c)=RULE(:,:,i,c,per);
            m=m+1;    
          end
        end
        No(c,1)=m-1;
      end
% now we wanna remove the rule that was extracted once in all period
     for c=1:C
       for i=1:No(c,1)
           if RULE_pool(1,1,i,c) >0
               tekrar=0;
              for j=i+1:No(c,1)
                 if RULE_pool(:,:,i,c)==RULE_pool(:,:,j,c)
                     tekrar=tekrar+1;
                    break
                 end
              end
              if tekrar==0
                  RULE_pool(:,:,i,c)=0;
              end
           end
       end
     end 
     % we remove zero rule from rule pool and count members of each rule pool 
     for c=1:C
        m=1;
        for i=1:No(c,1)
            if RULE_pool(1,1,i,c) > 0
                RULE1(:,:,m,c)=RULE_pool(:,:,i,c);
                m=m+1;
            end
        end
        NO1(c,1)=m-1;
    end
end

    

      