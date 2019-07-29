function [ M , L , kk] = T_MATCH2( NO,T_INDEX,RULE_POOL,day,MEAN_K,STD_K,MA25)
Match_kdr=zeros(1,1);
M=zeros(2,2);
  if MA25(day,1) <= MA25(day,2) % up trend
      y=[1 3];
      M(:,1)=y';
  else
      y=[2 4];
      M(:,1)=y';
  end
     for nn=1:2
         K=y(1,nn);
         %mm=0;
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     if MA25(day,1) <= MA25(day,2) % up trend
         if K==1
         for r=1:NO(K,1)
            Nkdr=0;
            Nkr=0;
            for i=1:4
                if RULE_POOL(i,1,r,K)==0
                    break;
                else
                    index1= T_INDEX(day,RULE_POOL(i,1,r,K));
                    Nkr=Nkr+1;
                    rslt=TABLE1(index1,RULE_POOL(i,1,r,K));
                    if RULE_POOL(i,2,r,K)==rslt
                        Nkdr=Nkdr+1;
                    end
                end
            end
            if RULE_POOL(1,1,r,K)~=0
               Match_kdr(r,K)= (Nkdr / Nkr)*RULE_POOL(6,1,r,K)*2;
             %  mm=mm+RULE_POOL(6,1,r,K);
            end
        end
         else   % K=2,3,4 in up trend
         for r=1:NO(K,1)
            Nkdr=0;
            Nkr=0;
            for i=1:4
                if RULE_POOL(i,1,r,K)==0
                    break;
                else
                    index1= T_INDEX(day,RULE_POOL(i,1,r,K));
                    Nkr=Nkr+1;
                    rslt=TABLE1(index1,RULE_POOL(i,1,r,K));
                    if RULE_POOL(i,2,r,K)==rslt
                        Nkdr=Nkdr+1;
                    end
                end
            end
            if RULE_POOL(1,1,r,K)~=0
               Match_kdr(r,K)= (Nkdr / Nkr)*RULE_POOL(6,1,r,K);
             %  mm=mm+RULE_POOL(6,1,r,K);
            end
        end
         end
         
     else % down trend
         if K==4
         for r=1:NO(K,1)
            Nkdr=0;
            Nkr=0;
            for i=1:4
                if RULE_POOL(i,1,r,K)==0
                    break;
                else
                    index1= T_INDEX(day,RULE_POOL(i,1,r,K));
                    Nkr=Nkr+1;
                    rslt=TABLE1(index1,RULE_POOL(i,1,r,K));
                    if RULE_POOL(i,2,r,K)==rslt
                        Nkdr=Nkdr+1;
                    end
                end
            end
            if RULE_POOL(1,1,r,K)~=0
               Match_kdr(r,K)= (Nkdr / Nkr)*RULE_POOL(6,1,r,K)*2;
              % mm=mm+RULE_POOL(6,1,r,K);
            end
        end
         else
         for r=1:NO(K,1)
            Nkdr=0;
            Nkr=0;
            for i=1:4
                if RULE_POOL(i,1,r,K)==0
                    break;
                else
                    index1= T_INDEX(day,RULE_POOL(i,1,r,K));
                    Nkr=Nkr+1;
                    rslt=TABLE1(index1,RULE_POOL(i,1,r,K));
                    if RULE_POOL(i,2,r,K)==rslt
                        Nkdr=Nkdr+1;
                    end
                end
            end
            if RULE_POOL(1,1,r,K)~=0
               Match_kdr(r,K)= (Nkdr / Nkr)*RULE_POOL(6,1,r,K);
              % mm=mm+RULE_POOL(6,1,r,K);
            end
        end
         end
         
     end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Match_kdr=Match_kdr.*(1/mm);
        M(nn,2)=sum(Match_kdr(:,K));
     end
    N=M;
    for nn=1:2
        k=M(nn,1);
        N(nn,2)=M(nn,2)-( MEAN_K(k) + 0.1*STD_K(k));
    end
    N=sortrows(N,2);
    L=N(end,1);
    if L==1 || L==2
        kk=1;
    else
        kk=2;
    end
 end