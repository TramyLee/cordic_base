function [S,C]=cordic(deg,width,index)
%宽度16位，1对应2^15次方
%width=2^16;
%index=15;
z(1)=deg;
x(1)=floor(0.60725*width/2);
y(1)=0;


for step=0:index
    if(z(step+1)>=0)
        x(step+2)=x(step+1)-floor(y(step+1)/2^step);
         y(step+2)=y(step+1)+floor(x(step+1)/2^step);
        z(step+2)=z(step+1)-floor(width*atan(1/2^step)*180/pi/360);
    else
        x(step+2)=x(step+1)+floor(y(step+1)/2^step);
         y(step+2)=y(step+1)-floor(x(step+1)/2^step);
        z(step+2)=z(step+1)+floor(width*atan(1/2^step)*180/pi/360);
    end
    
    
end


 C=x(index+1);
 S=y(index+1);


