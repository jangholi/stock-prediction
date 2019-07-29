function [ tic,signal,sb ] =SUBNODE_CHOOSER( team,nnc,Leaguesize,signal,epsilon )
 % tic is the choosing node
 % signal is for the prossesing node
 % sb is the number of subnode
    if team(nnc,1,Leaguesize)==1 %judgement node
                    
           choose=rand(1); %choosing subnode
           if choose < 1-epsilon   % larger Q subnode chosen
                 if team(nnc,3,Leaguesize) > team(nnc,5,Leaguesize)
                            % go for subnode 1
                      tic=team(nnc,4,Leaguesize); 
                      sb=1;
                 else
                            % go for subnode 2
                      tic=team(nnc,6,Leaguesize);
                      sb=2;
                 end
           else   
                rand_number=randi(2,1);
                 if rand_number==2
                            % go for subnode 2
                      tic=team(nnc,6,Leaguesize);
                      sb=2;
                 else
                            % go for subnode 1
                      tic=team(nnc,4,Leaguesize);
                      sb=1;
                 end 
           end
                    
                    
                    
    else                                     %processing node
        tic=0;   
        choose=rand(1); %choosing subnode                  
           if choose < 1-epsilon   % larger Q subnode chosen
                 if team(nnc,3,Leaguesize) > team(nnc,5,Leaguesize)
                            % go for subnode 1
                      signal=team(nnc,4,Leaguesize);
                      sb=1;
                 else
                            % go for subnode 2
                      signal=team(nnc,6,Leaguesize);
                      sb=2;
                 end
           else  
               rand_number=randi(2,1);
                 if rand_number==2
                            % go for subnode 2
                      signal=team(nnc,6,Leaguesize);
                      sb=2;
                 else
                            % go for subnode 1
                      signal=team(nnc,4,Leaguesize);
                      sb=1;
                 end
           end
    end
    
end

