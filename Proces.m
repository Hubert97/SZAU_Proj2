function [Xk,y] = Proces(Xkm1,Ukm4)
Xk=zeros(1,2);
Xk(1)=--1.599028*Xkm1(1)+Xkm1(2)+0.010754*g_1(Ukm4);
Xk(2)=-0.632337*Xkm1(1)+0.009231*g_1(Ukm4);
y=g_2(Xk(1));

end

