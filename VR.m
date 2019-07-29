function[VR5,VR10,VR25]=VR(data)
y=[5,10,25];   % three period thet we need

for np=1:3
    n=y(1,np);  % get the number of period

    [m1,m2]=size(data);
    for i=50:m1
      volume=0;
      upvolume=0;
      convolume=0;
        for j=1:n
            volume=volume+data(i-j+1,5);
            
            if data(i-j+1,4)>data(i-j+1,1)  % bullish day
                upvolume=upvolume+data(i-j+1,5);
            end
        end
        if abs( data(i,4) - data( i-n+1,4)) < 3
           convolume=volume * .5;
        end        
            VR(i-49,1)=(upvolume+(.5*convolume))/volume;
    end
        if n==5
            VR5=VR;
        elseif n==10
            VR10=VR;
        else
            VR25=VR;
        end
 end
end