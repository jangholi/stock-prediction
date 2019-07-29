function [no]=RULE_POOL_COUNTER(NO_of_rule_pool)
[m1,m2,m3]=size(NO_of_rule_pool);
no=zeros(m1,m2);
for kk=1:m3
    for i=1:m1
        no(i,1)=no(i,1)+NO_of_rule_pool(i,1,kk);
    end
end
end