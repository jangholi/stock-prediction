function [Best_formation]=LOSER(NUMBEROFCHANGES2,CD2,i,k,team,Best_formation,XBEST,X)

for L1=1:NUMBEROFCHANGES2 % for counting number of change
       V1=CD2(1,L1); % the row's number will be changed
       MAX_NUMBEROF_CHANGE=min(XBEST(V1,21,i),X(V1,21,k));% max number of change in every row
       SELECT3=randperm(XBEST(V1,21,i));
       CD3=SELECT3(1,1:MAX_NUMBEROF_CHANGE);
       M1=0; % number of change
       V2=ismember(XBEST(V1,1:XBEST(V1,21,i),i),X(V1,1:X(V1,21,k),k));
       for L2=1:MAX_NUMBEROF_CHANGE
         if ismember(XBEST(V1,CD3(1,L2),i),X(V1,1:X(V1,21,k),k))==1
             if XBEST(V1,CD3(1,L2),i)==22 % the node is processing node
                node_number=XBEST(V1,CD3(1,L2)+10,i);
                subnode_number=XBEST(V1,CD3(1,L2)+15,i);
                node_number1=X(V1,find(X(V1,:,k)==XBEST(V1,CD3(1,L2),i))+10,k);
                subnode_number1=X(V1,find(X(V1,:,k)==XBEST(V1,CD3(1,L2),i))+15,k);
                if subnode_number==1
                  M1=M1+1;
                  if subnode_number1==1
                      if node_number==team(node_number1,7,k)
                          Best_formation(node_number,7,i)=RAN2(node_number,61);
                      else
                          Best_formation(node_number,7,i)=team(node_number1,7,k);
                      end
                    Best_formation(node_number,3,i)=max(team(node_number1,3,k),Best_formation(node_number,3,i));
                  else %  if subnode_number1 
                      if node_number==team(node_number1,9,k)
                          Best_formation(node_number,7,i)=RAN2(node_number,61);
                      else
                          Best_formation(node_number,7,i)=team(node_number1,9,k);
                      end
                          Best_formation(node_number,3,i)=max(team(node_number1,5,k),Best_formation(node_number,3,i));
                   end
                else % if subnode_number
                  M1=M1+1;
                  if subnode_number1==1
                      if node_number==team(node_number1,7,k)
                          Best_formation(node_number,9,i)=RAN2(node_number,61);
                      else
                          Best_formation(node_number,9,i)=team(node_number1,7,k);
                      end
                    Best_formation(node_number,5,i)=max(team(node_number1,3,k),Best_formation(node_number,5,i));
                  else
                      if node_number==team(node_number1,9,k)
                          Best_formation(node_number,9,i)=RAN2(node_number,61);
                      else
                          Best_formation(node_number,9,i)=team(node_number1,9,k);
                      end
                    Best_formation(node_number,5,i)=max(team(node_number1,5,k),Best_formation(node_number,5,i));
                  end %  if subnode_number1
                end % if subnode_number
         else % thei's parameter is a judgment  
              node_number=XBEST(V1,CD3(1,L2)+10,i);
              subnode_number=XBEST(V1,CD3(1,L2)+15,i);
              node_number1=X(V1,find(X(V1,:,k)==XBEST(V1,CD3(1,L2),i))+10,k);
              subnode_number1=X(V1,find(X(V1,:,k)==XBEST(V1,CD3(1,L2),i))+15,k);
              if subnode_number==1
                  M1=M1+1;
                  if subnode_number1==1
                      if node_number==team(node_number1,7,k)
                          Best_formation(node_number,7,i)=RAN2(node_number,61); %Ci1A
                      else
                          Best_formation(node_number,7,i)=team(node_number1,7,k);
                      end
                      if node_number==team(node_number1,8,k)
                           Best_formation(node_number,8,i)=RAN2(node_number,61); %Ci1B
                      else
                           Best_formation(node_number,8,i)=team(node_number1,8,k);
                      end
                    Best_formation(node_number,3,i)=max(team(node_number1,3,k),Best_formation(node_number,3,i));
                  else
                      if node_number==team(node_number1,9,k)
                          Best_formation(node_number,7,i)=RAN2(node_number,61); %Ci1A
                      else
                          Best_formation(node_number,7,i)=team(node_number1,9,k);
                      end
                      if node_number==team(node_number1,10,k)
                          Best_formation(node_number,8,i)=RAN2(node_number,61); %Ci1B
                      else
                          Best_formation(node_number,8,i)=team(node_number1,10,k);
                      end
                    Best_formation(node_number,3,i)=max(team(node_number1,5,k),Best_formation(node_number,3,i));
                  end
              else
                  M1=M1+1;
                  if subnode_number1==1
                      if node_number==team(node_number1,7,k)
                          Best_formation(node_number,9,i)=RAN2(node_number,61); %Ci1A
                      else
                          Best_formation(node_number,9,i)=team(node_number1,7,k);
                      end
                      if node_number==team(node_number1,8,k)
                          Best_formation(node_number,10,i)=RAN2(node_number,61); %Ci1B
                      else
                          Best_formation(node_number,10,i)=team(node_number1,8,k);
                      end
                    Best_formation(node_number,5,i)=max(team(node_number1,3,k),Best_formation(node_number,5,i));
                  else
                      if node_number==team(node_number1,9,k)
                          Best_formation(node_number,9,i)=RAN2(node_number,61); %Ci1A
                      else
                          Best_formation(node_number,9,i)=team(node_number1,9,k);
                      end
                      if node_number==team(node_number1,10,k)
                          Best_formation(node_number,10,i)=RAN2(node_number,61); %Ci1B
                      else
                          Best_formation(node_number,10,i)=team(node_number1,10,k);
                      end
                    Best_formation(node_number,5,i)=max(team(node_number1,5,k),Best_formation(node_number,5,i));
                  end
              end
         end % if for processing
    else % the i's parameter is not belong to K
 % processing node for else ismember
if XBEST(V1,CD3(1,L2),i)==22 % the node is processing node
      node_number=XBEST(V1,CD3(1,L2)+10,i);
      subnode_number=XBEST(V1,CD3(1,L2)+15,i);
      node_number1=X(V1,X(V1,21,k)+10,k);
      subnode_number1=X(V1,X(V1,21,k)+15,k);
      if subnode_number==1
                 if X(V1,X(V1,21,k),k)==22
                    M1=M1+1;
                if subnode_number1==1
                    Best_formation(node_number,4,i)=team(node_number1,4,k);
                    if node_number==team(node_number1,7,k)
                        Best_formation(node_number,7,i)=RAN2(node_number,41);
                    else
                        Best_formation(node_number,7,i)=team(node_number1,7,k);
                    end
                    Best_formation(node_number,3,i)=max(team(node_number1,3,k),Best_formation(node_number,3,i));
                else %  if subnode_number1 
                    Best_formation(node_number,4,i)=team(node_number1,6,k);
                    if node_number==team(node_number1,9,k)
                        Best_formation(node_number,7,i)=RAN2(node_number,41);
                    else
                        Best_formation(node_number,7,i)=team(node_number1,9,k);
                    end
                    Best_formation(node_number,3,i)=max(team(node_number1,5,k),Best_formation(node_number,3,i));
                end
       else % if subnode_number
                 M1=M1+1;
                if subnode_number1==1
                    Best_formation(node_number,6,i)=team(node_number1,4,k);
                    if node_number==team(node_number1,7,k)
                        Best_formation(node_number,9,i)=RAN2(node_number,41);
                    else
                        Best_formation(node_number,9,i)=team(node_number1,7,k);
                    end
                    Best_formation(node_number,5,i)=max(team(node_number1,3,k),Best_formation(node_number,5,i));
                else
                    Best_formation(node_number,6,i)=team(node_number1,6,k);
                    if node_number==team(node_number1,9,k)
                        Best_formation(node_number,9,i)=RAN2(node_number,41);
                    else
                        Best_formation(node_number,9,i)=team(node_number1,9,k);
                    end
                    Best_formation(node_number,5,i)=max(team(node_number1,5,k),Best_formation(node_number,5,i));
                end %  if subnode_number1
                 end
       end % if subnode_number
else % the i's parameter is a judgment   
    if X(V1,21,k)>1
             node_number=XBEST(V1,CD3(1,L2)+10,i);
             subnode_number=XBEST(V1,CD3(1,L2)+15,i);
             memberof_k=randi(X(V1,21,k)-1,1);
             node_number1=X(V1,memberof_k+10,k);
             subnode_number1=X(V1,memberof_k+15,k);
             if subnode_number==1
                 M1=M1+1;
                if subnode_number1==1
                 Best_formation(node_number,4,i)=team(node_number1,4,k);
                 if node_number==team(node_number1,7,k)
                     Best_formation(node_number,7,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,7,i)=team(node_number1,7,k);
                 end
                 if node_number==team(node_number1,8,k)
                     Best_formation(node_number,8,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,8,i)=team(node_number1,8,k);
                 end
                 Best_formation(node_number,3,i)=max(team(node_number1,3,k),Best_formation(node_number,3,i));
                else %  if subnode_number1 
                 Best_formation(node_number,4,i)=team(node_number1,6,k);
                 if node_number==team(node_number1,9,k)
                     Best_formation(node_number,7,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,7,i)=team(node_number1,9,k);
                 end
                 if node_number==team(node_number1,10,k)
                     Best_formation(node_number,8,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,8,i)=team(node_number1,10,k);
                 end
                 Best_formation(node_number,3,i)=max(team(node_number1,5,k),Best_formation(node_number,3,i));
                end
             else % if subnode_number
                 M1=M1+1;
                if subnode_number1==1
                 Best_formation(node_number,6,i)=team(node_number1,4,k);
                 if node_number==team(node_number1,7,k)
                     Best_formation(node_number,9,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,9,i)=team(node_number1,7,k);
                 end
                 if node_number==team(node_number1,8,k)
                 Best_formation(node_number,10,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,10,i)=team(node_number1,8,k);
                 end
                     Best_formation(node_number,5,i)=max(team(node_number1,3,k),Best_formation(node_number,5,i));
                else
                 Best_formation(node_number,6,i)=team(node_number1,6,k);
                 if node_number==team(node_number1,9,k)
                     Best_formation(node_number,9,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,9,i)=team(node_number1,9,k);
                 end
                 if node_number==team(node_number1,10,k)
                     Best_formation(node_number,10,i)=RAN2(node_number,61);
                 else
                     Best_formation(node_number,10,i)=team(node_number1,10,k);
                 end
                 Best_formation(node_number,5,i)=max(team(node_number1,5,k),Best_formation(node_number,5,i));
                end %  if subnode_number1
             end % if subnode_number
    end
             
            end
         end % ismember
       end % number of change in culumn

  end % number of change in row
end