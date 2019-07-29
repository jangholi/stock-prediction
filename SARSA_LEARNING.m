function [team]=SARSA_LEARNING(type,reward,i,subnode_i,j,subnode_j,team,Leaguesize,alpha,gamma)
if type==1
    if subnode_i==1
      if subnode_j==1
        team(i,3,Leaguesize)= team(i,3,Leaguesize)+ alpha*( reward + gamma * team(j,3,Leaguesize)- team(i,3,Leaguesize) );
      else
        team(i,3,Leaguesize)= team(i,3,Leaguesize)+ alpha*( reward + gamma * team(j,5,Leaguesize)- team(i,3,Leaguesize) );
      end
    else
      if subnode_j==1
        team(i,5,Leaguesize)= team(i,5,Leaguesize)+ alpha*( reward + gamma * team(j,3,Leaguesize)- team(i,5,Leaguesize) );
      else
        team(i,5,Leaguesize)= team(i,5,Leaguesize)+ alpha*( reward + gamma * team(j,5,Leaguesize)- team(i,5,Leaguesize) );
      end
      
    end
else
    if subnode_i==1
        team(i,3,Leaguesize)= team(i,3,Leaguesize)+ alpha*( reward - team(i,3,Leaguesize) );
    else
        team(i,5,Leaguesize)= team(i,5,Leaguesize)+ alpha*( reward - team(i,5,Leaguesize) );
    end
end
end