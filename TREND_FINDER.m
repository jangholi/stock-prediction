function [ trend ] = TREND_FINDER( MA25,day )
% if the market was bullish , trend finder give us 1 
% if the market was bearish , trend finder give us 2 
    
        trend=MA25(day,1); % up-trend
    

end

