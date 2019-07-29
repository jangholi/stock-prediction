function [ M , L , kk] = T_MATCH4( NO,T_INDEX,RULE_POOL,day,MEAN_K,STD_K,MA25,Portfolio,up)
Match_kdr=zeros(1,1);
M=zeros(2,2);
  if MA25(day,1)==up % up trend
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
     if MA25(day,1) ==up % up trend
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
                if Nkr==Nkdr
                   Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                else
                    Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                end
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
               if Nkr==Nkdr
                   Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                else
                    Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                end
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
               if Nkr==Nkdr
                   Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                else
                    Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                end
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
                if Nkr==Nkdr
                   Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                else
                    Match_kdr(r,K)= (Nkdr / Nkr);%*RULE_POOL(6,1,r,K)*1;
                end;
              % mm=mm+RULE_POOL(6,1,r,K);
            end
        end
         end
         
     end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Match_kdr=Match_kdr.*(1/mm);
        %mm=nnz(Match_kdr(:,K));
        
        M(nn,2)=sum(Match_kdr(:,K))*(1/NO(K,1));
     end
    N=M;
 if MA25(day,1)==up % up trend
   if Portfolio>0
        k2=M(2,1);
        k1=M(1,1);
        if M(1,2) >= (MEAN_K(k1) + .1*STD_K(k1))
            L=k1;
        elseif  M(2,2) >= (MEAN_K(k2) + .2*STD_K(k2))
            L=k2;
        else
            L=5;
        end
    else
        k2=M(2,1);
        k1=M(1,1);
        if M(2,2) >= (MEAN_K(k2) + .1*STD_K(k2))
            L=k2;
        elseif  M(1,2) >= (MEAN_K(k1) + .2*STD_K(k1))
            L=k1;
        else
            L=5;
        end
   end
 else
   if Portfolio>0
        k2=M(2,1);
        k1=M(1,1);
        if M(1,2) >= (MEAN_K(k1) + .2*STD_K(k1))
            L=k1;
        elseif  M(2,2) >= (MEAN_K(k2) + .1*STD_K(k2))
            L=k2;
        else
            L=5;
        end
    else
        k2=M(2,1);
        k1=M(1,1);
        if M(2,2) >= (MEAN_K(k2) + .1*STD_K(k2))
            L=k2;
        elseif  M(1,2) >= (MEAN_K(k1) + .2*STD_K(k1))
            L=k1;
        else
            L=5;
        end
   end 
 end

    %g=N(1,2)/N(2,2);
    %if g>.8
     %   L=N(1,1);
    %else
    %    L=N(2,1);
   % end
    if L==1 || L==2
        kk=1;
    else
        kk=2;
    end
 end