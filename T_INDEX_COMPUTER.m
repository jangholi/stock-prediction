function [ INDEX ] = T_INDEX_COMPUTER( Price_Data )

  [ROD5,ROD10,ROD25]=ROD(Price_Data); % caculate ROD with test data
  INDEX(:,1:3)=[ROD5,ROD10,ROD25];
  [RSI5,RSI10,RSI25]=RSI(Price_Data); % caculate RSI with test data
  INDEX(:,4:6)=[RSI5,RSI10,RSI25];
  [ROC5,ROC10,ROC25]=ROC(Price_Data); % caculate ROD with test data
  INDEX(:,7:9)=[ROC5,ROC10,ROC25];
  [STOCHASTICS5,STOCHASTICS10,STOCHASTICS25]=STOCHASTICS(Price_Data); % caculate STOCHASTICS with test data
  INDEX(:,10:12)=[STOCHASTICS5,STOCHASTICS10,STOCHASTICS25];
  [VR5,VR10,VR15]=VR(Price_Data); % caculate VR with test data
  INDEX(:,13:15)=[VR5,VR10,VR15];
  [RCI5,RCI10,RCI25]=RCI(Price_Data); % caculate RCI with test data
  INDEX(:,16:18)=[RCI5,RCI10,RCI25];
  INDEX(:,19)=GOLDEN_DEAD_CROSS(Price_Data); % caculate GOLDEN_DEAD_CROSS with test data
  INDEX(:,20)=MACD(Price_Data); % caculate MACD with test data
  INDEX(:,21)=CANDLE(Price_Data); % caculate CANDLE with test data
end
