function [confidence]=SUPPORT_COUNTER_sell_up(a,a1,RULE_POOL,NO)


   Antecedent_Consequent1=0;
   Antecedent_Consequent2=0;
   Antecedent_Consequent3=0;
   Antecedent_Consequent4=0;
   Antecedent1=0;
   Antecedent2=0;
   Antecedent3=0;
   Antecedent4=0;

            parfor j=1:NO(1,1)
                kkk=Antecedent_Analyzer_buy_up(a1,RULE_POOL(1:4,:,j,1));
                if kkk==1
                    Antecedent1=Antecedent1+1;
                end
                kkk=Antecedent_Consequent_Analyzer_buy_up(a,RULE_POOL(:,:,j,1));
                if kkk==1
                    Antecedent_Consequent1=Antecedent_Consequent1+1;
                end
            end
            
            parfor j=1:NO(2,1)
                kkk=Antecedent_Analyzer_buy_down(a1,RULE_POOL(1:4,:,j,2));
                if kkk==1
                    Antecedent2=Antecedent2+1;
                end
                kkk=Antecedent_Consequent_Analyzer_buy_down(a,RULE_POOL(:,:,j,2));
                if kkk==1
                    Antecedent_Consequent2=Antecedent_Consequent2+1;
                end
            end
            
            
          parfor j=1:NO(3,1)
                kkk=Antecedent_Analyzer_sell_up(a1,RULE_POOL(1:4,:,j,3));
                if kkk==1
                    Antecedent3=Antecedent3+1;
                end
                kkk=Antecedent_Consequent_Analyzer_sell_up(a,RULE_POOL(:,:,j,3));
                if kkk==1
                    Antecedent_Consequent3=Antecedent_Consequent3+1;
                end
            end
            
            parfor j=1:NO(4,1)
                kkk=Antecedent_Analyzer_sell_down(a1,RULE_POOL(1:4,:,j,4));
                if kkk==1
                    Antecedent4=Antecedent4+1;
                end
                kkk=Antecedent_Consequent_Analyzer_sell_down(a,RULE_POOL(:,:,j,4));
                if kkk==1
                    Antecedent_Consequent4=Antecedent_Consequent4+1;
                end
            end
       Antecedent_Consequent= Antecedent_Consequent1+ Antecedent_Consequent2+Antecedent_Consequent3+ Antecedent_Consequent4;  
       Antecedent= Antecedent1+Antecedent2+Antecedent3+Antecedent4;
       confidence=Antecedent_Consequent/Antecedent;

end