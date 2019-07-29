function [RULE,No]=repeated_rule_terminator( RULE_POOL,NO,period)
C=size(NO,1);
%%%at first we remove rule in every period thet is extracted more than one 
  for c=1:C
    for per=1:period   %each class(sell-up,sell-down,buy-up.buy-down)
        for i=1:NO(c,1,per)
            if RULE_POOL(1,1,i,c,per)>0
               for j=i+1:NO(c,1,per)
                  if RULE_POOL(:,:,i,c,per) == RULE_POOL(:,:,j,c,per)
                     RULE_POOL(:,:,j,c,per)=0;
                  end
               end
            end
        end
    end
  end
  for c=1:C
      m=1;
      for per=1:period
        for i=1:NO(c,1,per)
            if RULE_POOL(1,1,i,c,per) > 0
                RULE(:,:,m,c)=RULE_POOL(:,:,i,c,per);
                m=m+1;
            end
        end
      end
    No(c,1)=m-1;
  end
end