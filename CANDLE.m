function CAN =CANDLE(data)
[m1,m2]=size(data);
for i=50:m1
    if data(i-1,1) < data(i-1,4) % day befor yesterday is UP-ward
        if data(i,1) < data(i,4) % yesterday is  UP-ward
            if data(i-1,2) < data(i,3)
                CAN(i-49,1)=1;
            else
                CAN(i-49,1)=2;
            end
        else% yesterday is  DOWN-ward
            if data(i-1,1) >= data(i,4)
                CAN(i-49,1)=7;
            else
                CAN(i-49,1)=8;
            end
        end
    else % day befor yesterday is DOWN-ward
        if data(i,1) >= data(i,4)% yesterday is  DOWN-ward
            if data(i-1,3) > data(i,2)
                CAN(i-49,1)=3;
            else
                CAN(i-49,1)=4;
            end
        else
            if data(i-1,1) >= data(i,4)
                CAN(i-49,1)=6;
            else
                CAN(i-49,1)=5;
            end
        end
    end
end
end  
        



          
            
            
         
                