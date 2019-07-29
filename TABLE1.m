function rslt=TABLE1(ivc,tic)

if tic==1 || tic==2 || tic==3 % ROD indicator
   if ivc <= -.05
       rslt=1;
   elseif (ivc > -.05 && ivc < 0)
       rslt=2;
   elseif (ivc >=0 && ivc < .05)
       rslt=3;
   elseif .05 <= ivc
       rslt=4;
   end
elseif tic==4 || tic==5 || tic==6 % RSI indicator
    if ivc <= 20
        rslt=1;
    elseif ivc > 20 && ivc < 50
        rslt=2;
    elseif ivc >= 50 && ivc < 80
        rslt=3;
    elseif ivc >= 80
        rslt=4;
    end
elseif tic==7 || tic==8 || tic==9 % ROC indicator
    if ivc < .9
        rslt=1;
    elseif ivc >= .9 && ivc < 1
        rslt=2;
    elseif ivc >= 1 && ivc < 1.1
        rslt=3;  
    elseif ivc >= 1.1
        rslt=4;
    end
elseif tic==10 || tic==11 || tic==12 % STOCH indicator
    if ivc <= 30
        rslt=1;
    elseif ivc > 30 && ivc < 50 
        rslt=2; 
    elseif ivc >= 50 && ivc < 70 
        rslt=3;
    elseif ivc >= 70
        rslt=4;
    end
elseif tic==13 || tic==14 || tic==15 % VR indicator
    if ivc < .3
        rslt=1;
    elseif ivc >= .3 && ivc < .5
        rslt=2;
    elseif ivc >= .5 && ivc < .7
        rslt=3;   
    elseif ivc >= .7
        rslt=4;
    end
elseif tic==16 || tic==17 || tic==18 % RCI indicator
    if ivc <= -.6
        rslt=1;
    elseif ivc > -.6 && ivc < .0
        rslt=2;
    elseif ivc >= 0 && ivc < .6
        rslt=3;
    elseif ivc >= .6
        rslt=4;
    end
elseif tic == 19 % CROSS
    rslt=ivc;
elseif tic == 20 % MACD
    rslt=ivc;
elseif tic ==21 % CANDLE
    rslt=ivc;
end
end