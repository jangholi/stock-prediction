function timetable=League_timetable(Leaguesize)
timetable=[[1:Leaguesize]' zeros(Leaguesize,1)];
bisectedlist=[[1:Leaguesize/2]
    [Leaguesize:-1:Leaguesize/2+1]];
for i=1:Leaguesize-1
    for j=1:Leaguesize/2
        timetable(bisectedlist(1,j),end)=bisectedlist(2,j);
        timetable(bisectedlist(2,j),end)=bisectedlist(1,j);
    end
    timetable=[timetable zeros(Leaguesize,1)];
    temporar=zeros(2,Leaguesize/2);
    temporar(1,1)=1;
    temporar(1,2)=bisectedlist(2,1);
    for k=3:Leaguesize/2
        temporar(1,k)=bisectedlist(1,k-1);
    end
    for k=1:Leaguesize/2-1
        temporar(2,k)=bisectedlist(2,k+1);
    end
    temporar(2,end)=bisectedlist(1,end);
    bisectedlist=temporar;
end
timetable(:,end)=[];
