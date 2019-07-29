function [Best_formation]=WINNER(NUMBEROFCHANGES1,CD1,i,j,Best_formation,XBEST,X)

for L1=1:NUMBEROFCHANGES1 % for counting number of change
       V1=CD1(1,L1); % the row's number will be changed
       MAX_NUMBEROF_CHANGE=min(XBEST(V1,21,i),X(V1,21,j));% max number of change in every row
       SELECT3=randperm(XBEST(V1,21,i)); 
       CD3=SELECT3(1,1:MAX_NUMBEROF_CHANGE);% give us the element that have to be changed in every row
       M1=0; % number of change
       V2=ismember(X(V1,1:X(V1,21,j),j),XBEST(V1,1:XBEST(V1,21,i),i));% the common element in every row between i and j
       % we wanna extract the common element between i and j in row V1
       if sum(V2) > 0  
          V3=find(ismember(XBEST(V1,1:XBEST(V1,21,i),i)),X(V1,1:X(V1,21,j),j));% find the similar indicator between i and j
           
          for L2=1:length(V3)
               if L2>MAX_NUMBEROF_CHANGE
                   break
               end
               if M1>MAX_NUMBEROF_CHANGE
                   break
               end
               node_number=XBEST(V1,V3(1,L2)+10,i);
               subnode_number=XBEST(V1,V3(1,L2)+15,i);
               if subnode_number==1
                   M1=M1+1;
                   if XBEST(V1,V3(1,L2),i)==22
                       Best_formation(node_number,4,i)=RAN(X(V1,X(V1,21,j)+5,j),2);
                   else
                       ss=[find(X(V1,1:X(V1,21,j),j)==XBEST(V1,V3(1,L2),i))];
                       Best_formation(node_number,4,i)=RAN(X(V1,ss(1,1),j),21); %IDi1 
                   end
               else
                   M1=M1+1;
                   if XBEST(V1,V3(1,L2),i)==22
                       Best_formation(node_number,6,i)=RAN(X(V1,X(V1,21,j)+5,j),2);
                   else
                       ss=[find(X(V1,1:X(V1,21,j),j)==XBEST(V1,V3(1,L2),i))];
                       Best_formation(node_number,6,i)=RAN(X(V1,ss(1,1),j),21); %IDi2 
                   end
               end
           end
       end% we changed i thad don't include j
               if M1< MAX_NUMBEROF_CHANGE | sum(V2)==0
                   
                   %extract the elemet that we change in previous step
                   if sum(V2)>0
                       V3=find(ismember(XBEST(V1,1:XBEST(V1,21,i),i)),X(V1,1:X(V1,21,j),j));% find the similar indicator between i and j
                       CD3=EXCLUDE(CD3,V3);
                   end
                   
                   numberof_change=M1;
                   
                for L2=1:(MAX_NUMBEROF_CHANGE-numberof_change)
                    if XBEST(V1,CD3(1,L2),i)==22
                        node_number=XBEST(V1,CD3(1,L2)+10,i);
                        subnode_number=XBEST(V1,CD3(1,L2)+15,i);
                        if subnode_number==1
                            rand_number=randi(40,1)+1;
                            if rand_number==Best_formation(node_number,7,i)
                                Best_formation(node_number,7,i)=rand_number; %Ci1A
                            else
                                M1=M1+1;
                                Best_formation(node_number,7,i)=rand_number; %Ci1A
                            end
                        else
                            rand_number=randi(40,1)+1;
                            if rand_number==Best_formation(node_number,8,i)
                            Best_formation(node_number,8,i)=rand_number; %Ci1B
                            else
                                M1=M1+1;
                                Best_formation(node_number,8,i)=rand_number; %Ci1B
                            end
                        end   
                    else
                        node_number=XBEST(V1,CD3(1,L2)+10,i);
                        subnode_number=XBEST(V1,CD3(1,L2)+15,i);
                        pm=rand(1);
                        if pm<.3% with this we can change connection betwenn node
                           M1=M1+1;
                           if subnode_number==1
                              pmm=randi(1);
                              if pmm<.5
                                 Best_formation(node_number,7,i)=RAN(node_number,61); %Ci1A
                              else
                                 Best_formation(node_number,8,i)=RAN(node_number,61); %Ci1B
                              end
                           else
                              pmm=randi(1);
                              if pmm<.5
                                 Best_formation(node_number,9,i)=RAN(node_number,61); %Ci2A
                              else
                                 Best_formation(node_number,10,i)=RAN(node_number,61); %Ci2B
                              end
                           end
                        else
                            M1=M1+1;
                            if subnode_number==1
                               Best_formation(node_number,4,i)=RAN1(X(V1,1:X(V1,21,j),j),21);
                            else
                               Best_formation(node_number,6,i)=RAN1(X(V1,1:X(V1,21,j),j),21);
                            end
                        end
                    end
                end 
            end
    end

end
