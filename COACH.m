function newformation=COACH(LEAGUE,team,Best_formation,scoreboard,league_schedule,week,XBEST,X,PC,Q0)



for counter=1:(LEAGUE-1)
    i=counter;
    j=league_schedule(i,week);
    L=league_schedule(i,week+1);
    k=league_schedule(L,week);
  
    [newformation]=GeneratingNewformation(i,j,L,k,team,Best_formation,scoreboard,XBEST,X,PC,Q0);
    
end
end