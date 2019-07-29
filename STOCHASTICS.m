function [ STOCHASTICS5,STOCHASTICS10,STOCHASTICS25 ] = STOCHASTICS( data )
n=size(data);
y=[5,10,15];
for nk=1:3
    np=y(1,nk);
    
    for i=48:n(1,1)
       LOW= min( data(i-np+1:i,3));
       HIGH= max( data(i-np+1:i,2));
       if (HIGH == LOW )
          K(i-47)=0; 
       else
          K(i-47)=100*( (data(i,1)-LOW ) / (HIGH - LOW ));
       end
    end
    
    for i=3:numel(K)
        D(i-2)=mean(K(i-2:i));
    end
    if np==5
        STOCHASTICS5=D';
    elseif np==10
        STOCHASTICS10=D';
    else
        STOCHASTICS25=D';
    end
end
end


     
        