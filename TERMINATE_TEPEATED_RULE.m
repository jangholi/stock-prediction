function[]=TERMINATE_TEPEATED_RULE(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD)
parpool('local',2);
parfor i=1:4
    if i==1
        TERMINATE_TEPEATED_RULE_HELP_BUY_UP(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD);
    elseif i==2
         TERMINATE_TEPEATED_RULE_HELP_BUY_DOWN(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD);
    elseif i==3
         TERMINATE_TEPEATED_RULE_HELP_SELL_UP(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD);
    elseif i==4
         TERMINATE_TEPEATED_RULE_HELP_SELL_DOWN(NO_of_rule_pool_GOOD ,RULE_POOL_GOOD);
    end
end
delete(gcp('nocreate'));




end