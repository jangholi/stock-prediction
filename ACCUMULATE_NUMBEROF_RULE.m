function []=ACCUMULATE_NUMBEROF_RULE(buy_up_number, buy_down_number,sell_up_number,sell_down_number )
KK=length(buy_up_number);

for i=2:KK
    buy_up_number(1,i) = buy_up_number(1,i) + buy_up_number(1,i-1);
    buy_down_number(1,i) = buy_down_number(1,i) + buy_down_number(1,i-1);
    sell_up_number(1,i) = sell_up_number(1,i) + sell_up_number(1,i-1);
    sell_down_number(1,i) = sell_down_number(1,i) + sell_down_number(1,i-1);
end
h=figure;
plot(buy_up_number,'g-')
hold on
plot(sell_up_number,'g--')
plot(buy_down_number,'r-')
plot(sell_down_number,'r--')
legend('buying rule for up trend','selling rule for up trend','buying rule for down trend','selling rule for down trend')
xlabel('week')
ylabel('the number of extracted rules')
hold off
saveas(h,'numberof_rule.fig','fig');
end
