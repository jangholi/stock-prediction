function[team,M_BACKWARD_Q,numberof_M]=BACKWARD_Q_LEARNING(team,M_BACKWARD_Q,numberof_M,Leaguesize,alpha_b,gamma_b)

if M_BACKWARD_Q(2,numberof_M)==1
   team( M_BACKWARD_Q(1,numberof_M) , 3 , Leaguesize )=team(M_BACKWARD_Q(1,numberof_M),3,Leaguesize)+alpha_b*(M_BACKWARD_Q(3,numberof_M)- team(M_BACKWARD_Q(1,numberof_M),3,Leaguesize));
else
    team( M_BACKWARD_Q(1,numberof_M) , 5 , Leaguesize )=team(M_BACKWARD_Q(1,numberof_M),5,Leaguesize)+alpha_b*(M_BACKWARD_Q(3,numberof_M)- team(M_BACKWARD_Q(1,numberof_M),5,Leaguesize));
end

for i =(numberof_M-1):-1:1
    if M_BACKWARD_Q(2,i)==1
        if M_BACKWARD_Q(2,i+1)==1
           team(M_BACKWARD_Q(1,i),3,Leaguesize) = team(M_BACKWARD_Q(1,i),3,Leaguesize)+alpha_b*(M_BACKWARD_Q(3,i)+(gamma_b*(max( team(M_BACKWARD_Q(1,i+1),5,Leaguesize),team(M_BACKWARD_Q(1,i+1),3,Leaguesize))))- team(M_BACKWARD_Q(1,i),3,Leaguesize));  
        else
            team(M_BACKWARD_Q(1,i),3,Leaguesize) = team(M_BACKWARD_Q(1,i),3,Leaguesize)+alpha_b*(M_BACKWARD_Q(3,i)+(gamma_b*(max( team(M_BACKWARD_Q(1,i+1),5,Leaguesize),team(M_BACKWARD_Q(1,i+1),3,Leaguesize))))- team(M_BACKWARD_Q(1,i),3,Leaguesize));
        end
    else
        if M_BACKWARD_Q(2,i+1)==1
           team(M_BACKWARD_Q(1,i),5,Leaguesize) = team(M_BACKWARD_Q(1,i),5,Leaguesize)+alpha_b*(M_BACKWARD_Q(3,i)+(gamma_b*(max( team(M_BACKWARD_Q(1,i+1),3,Leaguesize),team(M_BACKWARD_Q(1,i+1),5,Leaguesize))))- team(M_BACKWARD_Q(1,i),5,Leaguesize));  
        else
            team(M_BACKWARD_Q(1,i),5,Leaguesize) = team(M_BACKWARD_Q(1,i),5,Leaguesize)+alpha_b*(M_BACKWARD_Q(3,i)+(gamma_b*(max( team(M_BACKWARD_Q(1,i+1),3,Leaguesize),team(M_BACKWARD_Q(1,i+1),5,Leaguesize))))- team(M_BACKWARD_Q(1,i),5,Leaguesize));
        end
    end
end
M_BACKWARD_Q=zeros(3,1);
numberof_M=0;