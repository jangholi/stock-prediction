function rslt=TABLE(ivc,tic)

if tic==1 | tic==2 | tic==3 % ROD indicator
   if ivc <= -.1
       rslt=1;
   elseif ivc > -.1 && ivc <= -.05 
       rslt=2;
   elseif ivc > -.05 && ivc < .05
       rslt=3;
   elseif ivc >=.05 && ivc < .1
       rslt=4;
   elseif ivc >= .1
       rslt=5;
   end
elseif tic==4 | tic==5 | tic==6 % RSI indicator
    if ivc <= .2
        rslt=1;
    elseif ivc > .2 && ivc < .8
        rslt=2;
    elseif ivc >= .8
        rslt=3;
    end
elseif tic==7 | tic==8 | tic==9 % ROC indicator
    if ivc < .9
        rslt=1;
    elseif ivc >= .9 && ivc <= 1.1
        rslt=2;
    elseif ivc > 1.1
        rslt=3;
    end
elseif tic==10 | tic==11 | tic==12 % STOCH indicator
    if ivc <= .3
        rslt=1;
    elseif ivc > .3 && ivc < .7 
        rslt=2;
    elseif ivc >= .7
        rslt=3;
    end
elseif tic==13 | tic==14 | tic==15 % VR indicator
    if ivc < .3
        rslt=1;
    elseif ivc >= .3 && ivc <= .7
        rslt=2;
    elseif ivc > .7
        rslt=3;
    end
elseif tic==16 | tic==17 | tic==18 % RCI indicator
    if ivc <= -.7
        rslt=1;
    elseif ivc > -.7 && ivc < .7
        rslt=2;
    elseif ivc >= .7
        rslt=3;
    end
elseif tic == 19 % CROSS
    rslt=ivc;
elseif tic == 20 % MACD
    rslt=ivc;
elseif tic ==21 % CANDLE
    rslt=ivc;
end
end