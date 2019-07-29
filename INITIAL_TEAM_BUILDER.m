function [team]=INITIAL_TEAM_BUILDER(LEAGUE)
nn=61; % number of node in network
ng=LEAGUE; %number of team

team=zeros(nn,10,ng);

for n=1:ng
   team(1,1,n)=0; % define start node
   team(1,2,n)=5; % to prevent repetition
   team(1,10,n)=randi(40,1)+1; % connect start node to judgment node
   
   for node=2:41 % building judgmnet node
         team(node,1,n)=1;
         team(node,2,n)=5;    %di
         k1=randi(21,1); % select one indicator
         team(node,4,n)=k1;    %IDi1 --- select one indicator
         k2=randi(21,1); % select one indicator
          while k2==k1  % select another indicator that is defferent from first one
              k2=randi(21,1);
          end
         team(node,6,n)=k2; %IDi2 --- select one of indicator
         k3=randi(60,1)+1;
         while k3==node % select connection node
             k3=randi(60,1)+1;
         end
         team(node,7,n)=k3; %Ci1A --- write the first connection node
         k4=randi(60,1)+1;
         while k4==node | k4==k3
             k4=randi(60,1)+1;
         end
         team(node,8,n)=k4; %Ci1B --- write the second connection node
         k5=randi(60,1)+1;
         while k5==node
             k5=randi(60,1)+1;
         end
         team(node,9,n)=k5; %Ci2A ---  write the first connection node
         k6=randi(60,1)+1;
         while k6==node | k6==k5
             k6=randi(60,1)+1;
         end
         team(node,10,n)=k6; %Ci2B --- write the second connection node
        
   end % end of building judgment node
    for node=42:61  %building Processing nodes
            team(node,1,n)=2;
            team(node,2,n)=1;   %di
            team(node,4,n)=randi(2,1); %IDi1 ---subnode one
            team(node,6,n)=randi(2,1); %IDi2--- subnode two
            team(node,7,n)=randi(40,1)+1; %Ci1A ---first connection node
            team(node,9,n)=randi(40,1)+1; %Ci2A ---two connection node
        end
        
    end
    

end