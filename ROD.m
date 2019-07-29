function[ROD5,ROD10,ROD25]=ROD(data)
n=size(data);

for i=50:n(1,1)
      
       MA5(i-49,1)=1/5*(sum(data(i-4:i,4)));
       ROD5(i-49,1)=( data(i,4)-MA5(i-49,1) ) / MA5(i-49,1);
       
       MA10(i-49,1)=1/10*(sum(data(i-9:i,4)));
       ROD10(i-49,1)=( data(i,4)-MA10(i-49,1) ) / MA10(i-49,1);
       
       MA25(i-49,1)=1/25*(sum(data(i-24:i,4)));
       ROD25(i-49,1)=( data(i,4)-MA25(i-49,1) ) / MA25(i-49,1);
       
   end
end