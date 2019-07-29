function [ temp, rslt ] = RESULT1 (ivc, team , sb, Leaguesize, tic, nnc )

if tic==1 | tic==2 | tic==3 % ROD indicator
    rslt=TABLE1(ivc,tic);
   if sb==1
        if ivc >=0
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if ivc>=0
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic==4 | tic==5 | tic==6 % RSI indicator
    rslt=TABLE1(ivc,tic);
       if sb==1
        if ivc>=50 
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if ivc>=50
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic==7 | tic==8 | tic==9 % ROC indicator
    rslt=TABLE1(ivc,tic);
      if sb==1
        if ivc>=1 
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if ivc>=1
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic==10 | tic==11 | tic==12 % STOCH indicator
    rslt=TABLE1(ivc,tic);
       if sb==1
        if ivc>=.5
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if ivc>=.5 
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic==13 | tic==14 | tic==15 % VR indicator
    rslt=TABLE1(ivc,tic);
       if sb==1
        if ivc>=.5
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if ivc>=.5 
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic==16 | tic==17 | tic==18 % RCI indicator
    rslt=TABLE1(ivc,tic);
       if sb==1
        if ivc>=0 
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if ivc>=0
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic == 19 % CROSS
    rslt=TABLE1(ivc,tic);
       if sb==1
        if rslt==1 
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if rslt==1 
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic == 20 % MACD
    rslt=TABLE1(ivc,tic);
       if sb==1
        if rslt==1 
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if rslt==1 
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
elseif tic ==21 % CANDLE
    rslt=TABLE1(ivc,tic);
       if sb==1
        if rslt==1 | rslt==2 | rslt==5 | rslt==6
           temp=team(nnc,7,Leaguesize);
        else
            temp=team(nnc,8,Leaguesize);
        end
   else
       if rslt==1 | rslt==2 | rslt==5 | rslt==6
           temp=team(nnc,9,Leaguesize);
        else
            temp=team(nnc,10,Leaguesize);
       end
   end
end
end