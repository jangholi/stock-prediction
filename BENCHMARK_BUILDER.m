function [ TABLE ] = BENCHMARK_BUILDER(  )

    TABLE=zeros(8,21);
    %ROD
    TABLE(1,1:3)= -0.1;
    TABLE(2,1:3)= -0.05;
    TABLE(3,1:3)= 0.05;
    TABLE(4,1:3)= 0.1;
    TABLE(5,1:3)= 5;
    %RSI
    TABLE(1,4:6)= 0.2;
    TABLE(2,4:6)= 0.8;
    TABLE(3,4:6)= 1;
    %ROC
    TABLE(1,7:9)= 0.9;
    TABLE(2,7:9)= 1.1;
    TABLE(3,7:9)= 5;
    %STOCHASTICS
    TABLE(1,10:12)= 0.3;
    TABLE(2,10:12)= 0.7;
    TABLE(3,10:12)= 1;
    %VR
    TABLE(1,13:15)= 0.3;
    TABLE(2,13:15)= 0.7;
    TABLE(3,13:15)= 1;
    %RCI
    TABLE(1,16:18)= -0.7;
    TABLE(2,16:18)= 0.7;
    TABLE(3,16:18)= 1;
    %G/D CROSS
    TABLE(1,19)= 1;
    TABLE(2,19)= 2;
    TABLE(3,19)= 3;
    % MACD
    TABLE(1,20)= 1;
    TABLE(2,20)= 2;
    TABLE(3,20)= 3;
    %CANDLE
    TABLE(1,21)= 1;
    TABLE(2,21)= 2;
    TABLE(3,21)= 3;
    TABLE(4,21)= 4;
    TABLE(5,21)= 5;
    TABLE(6,21)= 6;
    TABLE(7,21)= 7;
    TABLE(8,21)= 8;
    
    
end

