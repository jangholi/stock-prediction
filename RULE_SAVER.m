function [ RULE_POOL_GOOD,RULE_POOL_BAD,BURN,BDRN,SURN,SDRN,LBURN,LBDRN,LSURN,LSDRN,BUY_UP,BUY_DOWN,SELL_UP,SELL_DOWN] = RULE_SAVER( RULE_POOL_GOOD,RULE_POOL_BAD,RP,champion,nonchampion,fitness_champion,fitness_nonchampion,BURN,BDRN,SURN,SDRN,LBURN,LBDRN,LSURN,LSDRN,BUY_UP,BUY_DOWN,SELL_UP,SELL_DOWN,up,down,rule_point,repetition_numebr)
champion_rule=RP(:,:,:,champion);
number=length(champion_rule);
if repetition_numebr==1
   %if fitness_champion>=0
    for i=1:number
        if champion_rule(1,1,i)>0
          if champion_rule(5,1,i) == 1% buy signal was extracted
              if champion_rule(5,2,i) == up   %buy - up
                
                  BURN=BURN+1;
                  BUY_UP=BUY_UP+1;
                  RULE_POOL_GOOD(1:5,:,BURN,1)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,BURN,1)=fitness_champion;
                
              elseif champion_rule(5,2,i) ==down    %buy - down
                
                  BDRN=BDRN+1;
                  BUY_DOWN=BUY_DOWN+1;
                  RULE_POOL_GOOD(1:5,:,BDRN,2)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,BDRN,2)=fitness_champion;
               
              end
          elseif champion_rule(5,1,i)== 2% sell was signal extracted
              if champion_rule(5,2,i) == up   %sell - up
                
                  SURN=SURN+1;
                  SELL_UP=SELL_UP+1;
                  RULE_POOL_GOOD(1:5,:,SURN,3)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,SURN,3)=fitness_champion;
                
              elseif champion_rule(5,2,i) == down    %sell - down
                
                  SDRN=SDRN+1;
                  SELL_DOWN=SELL_DOWN+1;
                  RULE_POOL_GOOD(1:5,:,SDRN,4)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,SDRN,4)=fitness_champion;
               
              end
          end
        end
    end
  % end 
else
%if fitness_champion>=0
    for i=1:number
        if champion_rule(1,1,i)>0
          if champion_rule(5,1,i) == 1% buy signal was extracted
              if champion_rule(5,2,i) == up   %buy - up
                if rule_point(i,1,champion)>0
                  BURN=BURN+1;
                  BUY_UP=BUY_UP+1;
                  RULE_POOL_GOOD(1:5,:,BURN,1)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,BURN,1)=fitness_champion;
                end
              elseif champion_rule(5,2,i) ==down    %buy - down
                if rule_point(i,1,champion)>0
                  BDRN=BDRN+1;
                  BUY_DOWN=BUY_DOWN+1;
                  RULE_POOL_GOOD(1:5,:,BDRN,2)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,BDRN,2)=fitness_champion;
                end
              end
          elseif champion_rule(5,1,i)== 2% sell was signal extracted
              if champion_rule(5,2,i) == up   %sell - up
                if rule_point(i,1,champion)>0
                  SURN=SURN+1;
                  SELL_UP=SELL_UP+1;
                  RULE_POOL_GOOD(1:5,:,SURN,3)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,SURN,3)=fitness_champion;
                end
              elseif champion_rule(5,2,i) == down    %sell - down
                if rule_point(i,1,champion)>0
                  SDRN=SDRN+1;
                  SELL_DOWN=SELL_DOWN+1;
                  RULE_POOL_GOOD(1:5,:,SDRN,4)= champion_rule(:,:,i);
                  RULE_POOL_GOOD(6,1,SDRN,4)=fitness_champion;
                end
              end
          end
        end
    end
%end
end
    nonchampion_rule=RP(:,:,:,nonchampion);
    number2=length(nonchampion_rule);
        for i=1:number2
        if nonchampion_rule(1,1,i)>0
          if nonchampion_rule(5,1,i) == 1% buy signal was extracted
              if nonchampion_rule(5,2,i) == up   %buy - up
                  LBURN=LBURN+1;
                  RULE_POOL_BAD(1:5,:,LBURN,1)= nonchampion_rule(:,:,i);
                  RULE_POOL_BAD(6,1,LBURN,1)=fitness_nonchampion;
              elseif nonchampion_rule(5,2,i) ==down    %buy - down
                  LBDRN=LBDRN+1;
                  RULE_POOL_BAD(1:5,:,LBDRN,2)= nonchampion_rule(:,:,i);
                  RULE_POOL_BAD(6,1,LBDRN,2)=fitness_nonchampion;
              end
          elseif nonchampion_rule(5,1,i)== 2% sell was signal extracted
              if nonchampion_rule(5,2,i) == up   %sell - up
                  LSURN=LSURN+1;
                  RULE_POOL_BAD(1:5,:,LSURN,3)= nonchampion_rule(:,:,i);
                  RULE_POOL_BAD(6,1,LSURN,3)=fitness_nonchampion;
              elseif nonchampion_rule(5,2,i) == down    %sell - down
                  LSDRN=LSDRN+1;
                  RULE_POOL_BAD(1:5,:,LSDRN,4)= nonchampion_rule(:,:,i);
                  RULE_POOL_BAD(6,1,LSDRN,4)=fitness_nonchampion;
              end
          end
        end
        end
  
end
