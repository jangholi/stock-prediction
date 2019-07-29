function[CROSS]=GOLDEN_DEAD_CROSS(data)
[m1,m2]=size(data);
for i=49:m1
    MA5(i-48)=1/5*sum(data(i-4:i,4));
    MA25(i-48)=1/25*sum(data(i-24:i,4));
end

CROSS(1,1)=3;

for i=2:numel(MA5)
    CROSS(i,1)=3;
    if MA5(i) > MA25(i)
        if MA5(i-1) <= MA25(i-1)
            CROSS(i,1)=1;  % golden cross
        end
    end
    if MA5(i) < MA25(i)
        if MA5(i-1) >= MA25(i-1)
        CROSS(i,1)=2;    % dead cross
        end
    end
end
CROSS=CROSS(2:end,1);
end