function [ MEAN_K,STD_K ] = MATCHNESS( WHOLE_INDEX,RULE_POOL,NO )
parpool('local',2);
m1=size(WHOLE_INDEX,1);
n1=size(NO,1);
MEAN_K=zeros(1,n1);
parfor day=1:m1
        Match_kdr_buy_up=MATCHNESS_HELP_buy_up( WHOLE_INDEX,RULE_POOL,NO,day );
        mkd_buy_up(day,1)=mean(Match_kdr_buy_up(:,1));
end

parfor day=1:m1
        Match_kdr_buy_down = MATCHNESS_HELP_buy_down( WHOLE_INDEX,RULE_POOL,NO,day);
        mkd_buy_down(day,1) = mean(Match_kdr_buy_down(:,1));
end

parfor day=1:m1
        Match_kdr_sell_up=MATCHNESS_HELP_sell_up( WHOLE_INDEX,RULE_POOL,NO,day );
        mkd_sell_up(day,1)=mean(Match_kdr_sell_up(:,1));
end

parfor day=1:m1
        Match_kdr_sell_down=MATCHNESS_HELP_sell_down( WHOLE_INDEX,RULE_POOL,NO,day );
        mkd_sell_down(day,1)=mean(Match_kdr_sell_down(:,1));
end

mkd=[mkd_buy_up mkd_buy_down mkd_sell_up mkd_sell_down];
for i=1:n1
    MEAN_K(i)=mean(mkd(:,i));
end
STD_K=std(mkd);
    delete(gcp('nocreate'));
end