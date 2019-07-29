function SB=SCORE(week,F_hat,fitness,scoreboard,league_schedule,Leaguesize)
SB=scoreboard;
for match=1:Leaguesize/2
    ateam=min(find(scoreboard(:,end)==0));
     i=ateam;
     j=find(league_schedule(:,week)==i);% find the team that i team have to play with in week
     if fitness(j,end)+fitness(i,end)-2*F_hat==0
     Probability_that_i_is_selected=0.5;
     else
     Probability_that_i_is_selected=(fitness(j,end)-F_hat)/(fitness(j,end)+fitness(i,end)-2*F_hat);
      end
      if rand<=Probability_that_i_is_selected
          SB(i,end)=3;
          SB(j,end)=-1;
      else
          SB(j,end)=3;
          SB(i,end)=-1;
       end
end