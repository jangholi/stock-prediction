function [ROC5,ROC10,ROC25]=ROC(data)
n=size(data);
  for i=50:n(1,1)
    

    ROC5(i-49,1)=((data(i,4)/data(i-5,4)));  

    ROC10(i-49,1)=((data(i,4)/data(i-10,4)));
 
    ROC25(i-49,1)=((data(i,4)/data(i-25,4)));

  end
end
