function [ INDEX ] = INDEX_BUILDER( data_indicator )
  [ROD5,ROD10,ROD25]=ROD(data_indicator); % caculate ROD 
  INDEX(:,1:3)=[ROD5,ROD10,ROD25];
  [RSI5,RSI10,RSI25]=RSI(data_indicator); % caculate RSI 
  INDEX(:,4:6)=[RSI5,RSI10,RSI25];
  [ROC5,ROC10,ROC25]=ROC(data_indicator); % caculate ROD 
  INDEX(:,7:9)=[ROC5,ROC10,ROC25];
  [STOCHASTICS5,STOCHASTICS10,STOCHASTICS25]=STOCHASTICS(data_indicator); % caculate STOCHASTICS 
  INDEX(:,10:12)=[STOCHASTICS5,STOCHASTICS10,STOCHASTICS25];
  [VR5,VR10,VR15]=VR(data_indicator); % caculate VR 
  INDEX(:,13:15)=[VR5,VR10,VR15];
  [RCI5,RCI10,RCI25]=RCI(data_indicator); % caculate RCI 
  INDEX(:,16:18)=[RCI5,RCI10,RCI25];
  INDEX(:,19)=GOLDEN_DEAD_CROSS(data_indicator); % caculate GOLDEN_DEAD_CROSS 
  INDEX(:,20)=MACD(data_indicator); % caculate MACD 
  INDEX(:,21)=CANDLE(data_indicator); % caculate CANDLE 
end