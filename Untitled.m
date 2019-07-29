% MAIN CODE
clear all;
clc;
LEAGUE=20;
NUMBEROF_SEASON=2;
period=30;
punishmnet=.01;
alpha=.1;
gamma=.4;
Suppression_epsilon=.1;
%Creat first team randomly.

[ team ] = INITIAL_TEAM_BUILDER(LEAGUE);



% Read DATA
wholedata=xlsread('SHE-KHARK.xlsx','A1:F825');%read whole data

WHOLE_MA25=MOVING_AVERIG(wholedata);


RULE_POOL=zeros(5,2,1,1);

timetable=League_timetable(LEAGUE); % create timetable with first culumn that is the numer of each team
league_schedule=timetable(:,2:end); % create schedule 
PC=.5;
Q0=1;
epsilon=.1;
LL=0;
alpha_b=.9;
gamma_b=.95;
for Numberof_seasons=1:period  % Numberof_seasons counter 
    %Rule counters in rule pools:
    BURN=0;
    BDRN=0;
    SURN=0;
    SDRN=0;
    INDEX=zeros(1,1);
    Best_formation=team;
    Best_score=zeros(LEAGUE,1);
    XBEST=zeros(25,21,LEAGUE);
   for day=1:25
       data_trade(day,:)=wholedata(25*(Numberof_seasons-1)+day+50,:);% the first day is 51 for trade
       MA(day,:)=WHOLE_MA25(25*(Numberof_seasons-1)+day,:);
   end
   for day=1:74         % Day coubter
      data_indicator(day,:)=wholedata(25*(Numberof_seasons-1)+day,:);% the data for firt day trade must start from 50
   end

   % Indexes Compution
   [ INDEX ] = INDEX_BUILDER( data_indicator );
 
   for i=1:25
        WHOLE_INDEX(25*(Numberof_seasons-1)+i,:)=INDEX(i,:);
   end
  
   % Starting the rule extraction
   
 for season=1:NUMBEROF_SEASON          
   for week=1:(LEAGUE-2)
       X=zeros(25,21,LEAGUE); % we use this for evolving   
       BUY_UP=0;
       BUY_DOWN=0;
       SELL_UP=0;
       SELL_DOWN=0;
       for Leaguesize=1:LEAGUE
           
           n=0;
           Rule_No=0;
           portfolio=0;
           cash=10000000;
           sell_done=0;
           buy_done =0;
           sell_price=0;
           buy_price=0;
           sarsa_node=0;sarsa_subnode=0;
           M_BACKWARD_Q=zeros(3,1);
           for day=1:25
              % do the LCA
              signal=0;
              SARSA_PARAMETER=zeros(2,5);
              tech_index=zeros(1,5);
              result=zeros(1,5);
              subnode=zeros(1,5);
              next_node=zeros(1,5);
              nnc1=zeros(1,5);    % we create this for saving nodes on path
              if day==1
                  nnc=team(1,10,1);
              end
              for counter=1:5                  
                  nnc1(counter)=nnc;
                  SARSA_PARAMETER(1,counter)=nnc;
                  %choose subnode                  
                  [ tic,signal,sb ] = SUBNODE_CHOOSER( team,nnc,Leaguesize,signal,epsilon );
                  tech_index(counter)=tic;
                  subnode(counter)=sb;
                  SARSA_PARAMETER(2,counter)=sb;
                  if signal==0
                     ivc= INDEX(day,tic);
                     %Compare
                     [ temp,rslt ] = RESULT (ivc, team, sb, Leaguesize, tic, nnc );
                     result(counter)=rslt; 
                     nnc= temp; % select next node for next movement 
                     next_node(counter)=nnc;  % save the node's number
                  else
                      if sb==1
                          nnc=team(nnc,7,Leaguesize);
                      else
                          nnc=team(nnc,9,Leaguesize);
                      end
                      break; % break the for, becauase we have signal for buying or selling
                  end
              end
              if sarsa_node > 0
                  team=SARSA_LEARNING(1,reward,sarsa_node,sarsa_subnode,SARSA_PARAMETER(1,1),SARSA_PARAMETER(2,1),team,Leaguesize,alpha,gamma);
              end
                  sarsa_node=SARSA_PARAMETER(1,counter);
                  sarsa_subnode=SARSA_PARAMETER(2,counter);
              for i=1:counter-1
                  team=SARSA_LEARNING(1,0,SARSA_PARAMETER(1,i),SARSA_PARAMETER(2,i),SARSA_PARAMETER(1,i+1),SARSA_PARAMETER(2,i+1),team,Leaguesize,alpha,gamma);
              end
              if signal==0 % for compeleting X when we have no signal and we have no rule
                  for i=1:counter
                      if i==1
                          X(day,21,Leaguesize)=counter;
                      end
                      X(day,i,Leaguesize)=tech_index(i);
                      X(day,i+5,Leaguesize)=result(i);
                      X(day,i+10,Leaguesize)=nnc1(i);
                      X(day,i+15,Leaguesize)=subnode(i);
                  end
                  if buy_done==1 && sell_done==0
                         for i=1:counter
                             numberof_M=numberof_M+1;
                             M_BACKWARD_Q(1,numberof_M)=X(day,i+10,Leaguesize);
                             M_BACKWARD_Q(2,numberof_M)=X(day,i+15,Leaguesize);
                             if i==counter
                                M_BACKWARD_Q(3,numberof_M)=-(punishmnet * data_trade(day,6));
                             else
                                M_BACKWARD_Q(3,numberof_M)=0; 
                             end
                         end
                  end
                  reward= -(punishmnet * data_trade(day,6));
              end 
              
              if signal ==1
                  reward=0;
                 if counter==1
                     X(day,counter,Leaguesize)=22;
                     X(day,counter+5,Leaguesize)=signal;
                     X(day,counter+10,Leaguesize)=nnc1(counter);
                     X(day,counter+15,Leaguesize)=subnode(counter);
                 else
                 %save the rule
                 Rule_No=Rule_No+1; % another rule was created 
                 for i=1:counter-1
                     RP(i,1,Rule_No,Leaguesize)=tech_index(i);
                     RP(i,2,Rule_No,Leaguesize)=result(i);
                     X(day,i,Leaguesize)=tech_index(i);
                     X(day,i+5,Leaguesize)=result(i);
                     X(day,i+10,Leaguesize)=nnc1(i);
                     X(day,i+15,Leaguesize)=subnode(i);
                     if i==1
                          X(day,21,Leaguesize)=counter;
                     end

                 end
                 X(day,counter,Leaguesize)=22; % for recognizing processing node
                 X(day,counter+5,Leaguesize)=signal;
                 X(day,counter+10,Leaguesize)=nnc1(counter);
                 X(day,counter+15,Leaguesize)=subnode(counter);
                 RP(5,1,Rule_No,Leaguesize)=signal;
                 % Indicating the market trend
                 [ trend ] = TREND_FINDER ( MA,day );
                 RP(5,2,Rule_No,Leaguesize)=trend; 
                 end
                   if buy_done==1 && sell_done==0
                         for i=1:counter
                             numberof_M=numberof_M+1;
                             M_BACKWARD_Q(1,numberof_M)=X(day,i+10,Leaguesize);
                             M_BACKWARD_Q(2,numberof_M)=X(day,i+15,Leaguesize);
                             M_BACKWARD_Q(3,numberof_M)=0; 
                         end
                  end
                 if buy_done==0
                    % buy stock if applicable
                    [ portfolio, cash ] = BUY ( data_trade, portfolio, cash, day );
                    buy_done=1;
                    sell_done=0;
                    % save the records
                    buy_price= data_trade(day,6);
                    if counter > 1
                        for i=1:counter
                             M_BACKWARD_Q(1,i)=X(day,i+10,Leaguesize);
                             M_BACKWARD_Q(2,i)=X(day,i+15,Leaguesize);
                             M_BACKWARD_Q(3,i)=0;
                        end
                        numberof_M=counter;
                    % when we have only one processing node
                    else
                        for i=1:5
                             M_BACKWARD_Q(1,i)=X(day-1,i+10,Leaguesize);
                             M_BACKWARD_Q(2,i)=X(day-1,i+15,Leaguesize);
                             M_BACKWARD_Q(3,i)=0;
                        end
                        M_BACKWARD_Q(3,5)=-(punishmnet * data_trade(day-1,6));
                        M_BACKWARD_Q(1,6)=X(day,11,Leaguesize);
                        M_BACKWARD_Q(2,6)=X(day,16,Leaguesize);
                        M_BACKWARD_Q(3,6)=0;
                        numberof_M=6;
                    end
                 end
              end
              
              if signal ==2
                  reward=0;

                 if counter==1
                     X(day,counter,Leaguesize)=22;
                     X(day,counter+5,Leaguesize)=signal;
                     X(day,counter+10,Leaguesize)=nnc1(counter);
                     X(day,counter+15,Leaguesize)=subnode(counter);
                 else
                 %save the rule
                 Rule_No=Rule_No+1;
                 for i=1:counter-1
                    RP(i,1,Rule_No,Leaguesize)=tech_index(i);
                    RP(i,2,Rule_No,Leaguesize)=result(i);
                     X(day,i,Leaguesize)=tech_index(i);
                     X(day,i+5,Leaguesize)=result(i);
                     X(day,i+10,Leaguesize)=nnc1(i);
                     X(day,i+15,Leaguesize)=subnode(i);
                     if i==1
                          X(day,21,Leaguesize)=counter;
                      end
                 end
                 X(day,counter,Leaguesize)=22; % for recognizing processing node
                 X(day,counter+5,Leaguesize)=signal;
                 X(day,counter+10,Leaguesize)=nnc1(counter);
                 X(day,counter+15,Leaguesize)=subnode(counter);
                 RP(5,1,Rule_No,Leaguesize)=signal;
                 % Indicating the market trend
                 [ trend ] = TREND_FINDER (MA,day );
                 RP(5,2,Rule_No,Leaguesize)=trend;
                 end
                  if buy_done==1 && sell_done==0
                         for i=1:counter
                             numberof_M=numberof_M+1;
                             M_BACKWARD_Q(1,numberof_M)=X(day,i+10,Leaguesize);
                             M_BACKWARD_Q(2,numberof_M)=X(day,i+15,Leaguesize);
                             M_BACKWARD_Q(3,numberof_M)=0; 
                         end
                         sell_price= data_trade(day,6);
                         M_BACKWARD_Q(3,numberof_M)=sell_price - buy_price;
                         [team,M_BACKWARD_Q,numberof_M]=BACKWARD_Q_LEARNING(team,M_BACKWARD_Q,numberof_M,Leaguesize,alpha_b,gamma_b);
                  end
                 if buy_done==1
                    % sell stock if applicable
                    [ portfolio, cash ] = SELL ( data_trade, portfolio, cash, day);
                    buy_done=0;
                    sell_done=1;
                    % save the records
                    sell_price= data_trade(day,6); 
                 end
                 % compute rewards
                 if sell_done ==1
                    n=n+1;
                    R(n)=sell_price - buy_price; % return for each trade
                    reward = sell_price - buy_price;
                 end
              end
              if day==25 && buy_done==1
                  [ portfolio, cash ] = SELL ( data_trade, portfolio, cash, day );
                  n=n+1;
                  R(n)=sell_price - buy_price; % return for each trade
                  reward = sell_price - buy_price;
                  team=SARSA_LEARNING(2,reward,sarsa_node,sarsa_subnode,SARSA_PARAMETER(1,1),SARSA_PARAMETER(2,1),team,Leaguesize,alpha,gamma);
              end
              WHOLE_INDEX(25*(Numberof_seasons-1)+day,:)=INDEX(day,:);
           end
                      
           % Calculate the fitness
           [ profit ] = FITNESS_FUNCTION ( R  );
           fitness(Leaguesize,2)=profit;
           fitness(Leaguesize,1)=Leaguesize;
           if week==1 && season==1
               Best_score(Leaguesize,1)=profit;
               XBEST=X;
           end
           
       end % end of "for Leaguesize"
       
       % Find and save the champion 
       sortedfitness=sortrows(fitness,-2);
       champion=sortedfitness(1,1);
       
       % Save the Rules in RULE POOLS.
       [ RULE_POOL,BURN,BDRN,SURN,SDRN,BUY_UP,BUY_DOWN,SELL_UP,SELL_DOWN ] = RULE_SAVER( RULE_POOL,RP,champion,Numberof_seasons,BURN,BDRN,SURN,SDRN,BUY_UP,BUY_DOWN,SELL_UP,SELL_DOWN );
      
       %find best formation if week >=2
       if week>=2
           [Best_formation,Best_score,XBEST]=GREEDY(LEAGUE,team,fitness,Best_score,X,XBEST,Best_formation);
       end
       
       % find Fhat
       f_hat=sort(Best_score);
       F_hat=f_hat(end);
       
       %define and calculate scoreboard
       scoreboard=zeros(LEAGUE,1);
       scoreboard=SCORE(week,F_hat,fitness,scoreboard,league_schedule,LEAGUE);

       % do the coaching
       [ team ] = COACH(LEAGUE,team,Best_formation,scoreboard,league_schedule,week,XBEST,X,PC,Q0);
       LL=LL+1;
       buy_up_number(1,LL)=BUY_UP;
       buy_down_number(1,LL)=BUY_DOWN;
       sell_up_number(1,LL)=SELL_UP;
       sell_down_number(1,LL)=SELL_DOWN;
   end
end
NO_of_rule_pool(1,1,Numberof_seasons)=BURN;
NO_of_rule_pool(2,1,Numberof_seasons)=BDRN;
NO_of_rule_pool(3,1,Numberof_seasons)=SURN;
NO_of_rule_pool(4,1,Numberof_seasons)=SDRN;    
end %end of for that we use for counting Numberof_seasons

ACCUMULATE_NUMBEROF_RULE(buy_up_number, buy_down_number,sell_up_number,sell_down_number );

% terminating repeated and just-once-extracted rules.
%[ RULE_POOL,NO ] = RULE_TERMINATOR( RULE_POOL,NO_of_rule_pool,period);


% compute matchness
%[ MEAN_K,STD_K ] = MATCHNESS( WHOLE_INDEX,RULE_POOL,NO );
save('buy_up_number.mat','buy_up_number');
save('buy_down_number.mat','buy_down_number');
save('sell_up_number.mat','sell_up_number');
save('sell_down_number.mat','sell_down_number');
save('RULE POOL.mat','RULE_POOL');
save('period.mat','period');
%save('MATCH INFO.mat','MEAN_K','STD_K');
%save('NO.mat','NO');
save('NO_of_rule_pool.mat','NO_of_rule_pool');
save('WHOLE_INDEX.mat','WHOLE_INDEX');