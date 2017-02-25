%计算cordic误差

clc
clear
s=zeros(1,91);
c=zeros(1,91);
std_s=zeros(1,91);
std_c=zeros(1,91);
S_err=zeros(1,91);
width1=2^16;
index1=7;
for i=0:90
    deg=floor(width1*i/360);
    [s(i+1),c(i+1)]=cordic(deg,width1,index1);
    std_s(i+1)=width1*sind(i)/2;
    std_c(i+1)=width1*cosd(i)/2;
     S_err(i+1)=abs(std_s(i+1)-s(i+1));   
end
subplot(2,1,1);
plot(0:90,S_err,'r*');
%ylim([0 300]);
ylim([0 max(S_err)*1.2]);
title('误差');
xlabel('deg');
ylabel('abs(err*2^{15})');
subplot(2,1,2);

%位宽16位，迭代次数9次
plot(0:90,std_s,'r*',0:90,s,'b+');
ylim([0 2^15+2^12]);
title('sin(x)cordic与真实值比较');
xlabel('deg');
ylabel('sin(x)*2^15');

 fprintf('+--------------------------------+\n');

for i=0:18
    fprintf('|  %4d  | %9d | %9d |\n',i*5,s(i*5+1),floor(std_s(i*5+1)));
    fprintf('+--------------------------------+\n');
end
   







