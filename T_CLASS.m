function [ k ] = T_CLASS( MA25,day,Portfolio )

   
    if MA25(day,1) <= MA25(day,2)
        trend=1;        %UpTrend
        if Portfolio == 0
            k=1;        %Buy-Up
        else
            k=3;        %Sell-Up
        end
    else 
        trend=2;        %DownTrend
        if Portfolio == 0
            k=2;        %Buy-Down
        else
            k=4;        %Sell-Down
        end
    end
    
end