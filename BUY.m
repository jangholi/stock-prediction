function [ portfolio, cash ] =  BUY ( data, portfolio, cash, day )

    
    amount= floor(cash / (data(day,6)*(1+.00486)));
    portfolio= portfolio + amount;
    cash= cash - amount*data(day,6)*(1+.00486);


end

