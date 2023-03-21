Pi=3.1415926535898;
toe=244800;
sqas=5153.65531;
es=0.005915038265;
i0=0.9848407943;
W0=1.038062244;
w=-1.717457876;
M0=-1.064739758;
deln=4.249105564*10^(-9);
i=7.422851197*10^(-51);
W=-8.151768125*10^(-9);
Cuc=3.054738045*10^(-7);
Cus=2.237036824*10^(-6);
Crc=350.53125;
Crs=2.53125;
Cic=-8.381903172*10^(-8);
Cis=8.940696716*10^(-8);
%%%%%%%%%%%星历参数%%%%%%%%%%%%%
%第一步
t=239050.7223;
tk=t-toe;

%第二步
n0=1.458555*10^(-4);
n=n0+deln;

%第三步
Mk=M0+n*tk+2*Pi;

%第四步&第五步
E0=Mk;
Ek=0;
while abs(Ek-E0)>1e-15
    Ek=E0;
    E0=Mk+es*sin(Ek);
end

%第五步
v1=sqrt(1-es^2)*sin(E0);
v2=cos(Ek)-es;
vk=atan2(v1,v2);

%第六步
psik=vk+w;

%第七步
zatuk=Cus*sin(2*psik)+Cuc*cos(2*psik);
zatrk=Crs*sin(2*psik)+Crc*cos(2*psik);
zatik=Cis*sin(2*psik)+Cic*cos(2*psik);

%第八步
uk=psik+zatuk;
rk=sqas^2*(1-es*cos(Ek))+zatrk;
ik=i0+i*tk+zatik;

%第九步
xk=rk*cos(uk);
yk=rk*sin(uk);

%第十步
We=7.2921151467*10^(-5);
Wk=W0+(W-We)*tk-We*toe;

%第十一步
x=xk*cos(Wk)-yk*cos(ik)*sin(Wk);
y=xk*sin(Wk)+yk*cos(ik)*cos(Wk);
z=yk*sin(ik);
t=[x;y;z];