function [ profit ] = FITNESS_FUNCTION( R )

    
    profit=0;
    for i=1:numel(R);
        profit = profit + ( R(i)) ;
    end


end
