function [Best_formation]=GeneratingNewformation(i,j,L,k,team,Best_formation,scoreboard,XBEST,X,PC,Q0)
[N,N1,N2]=size(X);
NUMBEROFCHANGES1=ceil(log(1-((1-((1-PC)^N))*rand(1)))/log(1-PC));
SELECT1=randperm(N);% creat a vector with size of N 
CD1=SELECT1(1,1:NUMBEROFCHANGES1); % a vector of row's number that will be changed
NUMBEROFCHANGES2=ceil(log(1-((1-((1-PC)^N))*rand(1)))/log(1-PC));
SELECT2=randperm(N);
CD2=SELECT2(1,1:NUMBEROFCHANGES2);


    if scoreboard(i,end)==3 && scoreboard(L,end)==3 %i was winner and L was winner
    
     Best_formation=WINNER(NUMBEROFCHANGES1,CD1,i,j,Best_formation,XBEST,X);
     Best_formation=WINNER(NUMBEROFCHANGES2,CD2,i,k,Best_formation,XBEST,X);
   
    elseif scoreboard(i,end)==3 && scoreboard(L,end)==-1 %i was winner and L was looser
    
     Best_formation=WINNER(NUMBEROFCHANGES1,CD1,i,j,Best_formation,XBEST,X);   
     Best_formation=LOSER(NUMBEROFCHANGES2,CD2,i,k,team,Best_formation,XBEST,X);
     
    elseif scoreboard(i,end)==-1 && scoreboard(L,end)==3 %i was  looser and L was winner
      
     Best_formation=LOSER(NUMBEROFCHANGES1,CD1,i,j,team,Best_formation,XBEST,X);
     Best_formation=WINNER(NUMBEROFCHANGES2,CD2,i,k,Best_formation,XBEST,X);
    
    elseif scoreboard(i,end)==-1 && scoreboard(L,end)==-1 %i was  looser and L was looser
    
      Best_formation=LOSER(NUMBEROFCHANGES1,CD1,i,j,team,Best_formation,XBEST,X); 
      Best_formation=LOSER(NUMBEROFCHANGES2,CD2,i,k,team,Best_formation,XBEST,X);                 
    end
end

                       
                   
