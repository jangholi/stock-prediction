function [ portfolio, cash ] = SELL ( data, portfolio, cash, day )


    if portfolio > 0 % if we have stock
       amount = portfolio;
       cash = cash + amount*data(day,6)*(1-.01029); % the whole amount of money that we have
       portfolio= 0;
    end
    
end