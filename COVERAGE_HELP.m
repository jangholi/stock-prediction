function [ cover]=COVERAGE_HELP(WHOLE_INDEX,a1)
            mm=0;
            [m1,m2]=size(WHOLE_INDEX);
             b4=[1:21;1:21]';% every row for one indicator
             cover=zeros(m1,1);
        for day=1:m1
            for kk=1:m2
                b4(kk,2)=TABLE1( WHOLE_INDEX(day,kk),kk);
            end
            j=1;
            for i=1:4
                if a1(i,1)==0
                    break;
                else
                    if b4(a1(i,1),2)~=a1(i,2)
                        j=-1;
                        break;
                    end
                end
            end
            if j==1
                mm=mm+1;
                cover(mm,1)=day;
            end
        end
end