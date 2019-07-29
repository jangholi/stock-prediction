function [newformation,BS,XBE]=GREEDY(LEAGUE,team,fitness,Best_score,X,XBEST,Best_formation)

n=LEAGUE;

for i=1:n
    if fitness(i,2) > Best_score(i,1)
       newformation(:,:,i)=team(:,:,i);
       BS(i,1)=fitness(i,2);
       XBE(:,:,i)=X(:,:,i);
    else
        newformation(:,:,i)=Best_formation(:,:,i);
        BS(i,1)=Best_score(i,1);
        XBE(:,:,i)=XBEST(:,:,i);
    end 
end 
    