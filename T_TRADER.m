function [ Portfolio,Cash,sell_price,buy_price ] = T_TRADER( k,data_trade,day,Cash,Portfolio,sell_price,buy_price )

    if k == 1 || k == 2 % buy stock
        if Portfolio==0
            amount= floor(Cash / (data_trade(day,6)*(1+.00486)));
            Portfolio= Portfolio + amount;
            Cash= Cash - amount*data_trade(day,6)*(1+.00486);
            buy_price=data_trade(day,6);
        end
    elseif k == 3 || k == 4 % sell stock
        if Portfolio > 0
            amount = Portfolio;
            Cash = Cash + amount*data_trade(day,6)*(1-.01029);
            Portfolio= 0;   
            sell_price=data_trade(day,6);
        end
    end
end