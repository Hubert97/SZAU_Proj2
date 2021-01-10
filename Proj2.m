simtime=5000;

X=zeros(2,simtime);
U=zeros(1,simtime);
Y=zeros(1,simtime);

U(100:simtime)=-0.5;
U(200:simtime)=-0.0;
U(300:simtime)=0.5;
U(400:simtime)=0.5;
U(500:simtime)=-0.15;
U(600:simtime)=-0.10;
U(700:simtime)=0.15;
U(800:simtime)=0.15;
U(900:simtime)=-0.8;
U(1000:simtime)=-0.0;
U(1100:simtime)=0.8;
U(1300:simtime)=-0.7;
U(1400:simtime)=-0.6;
U(1800:simtime)=0.8;

U(2100:simtime)=-0.8;
U(2400:simtime)=-0.023;
U(2600:simtime)=0.89;
U(2900:simtime)=0.15;
U(3200:simtime)=0.55;
U(3500:simtime)=0.10;
U(3600:simtime)=0.31;
U(3900:simtime)=0.15;
U(4100:simtime)=0.8;
U(4300:simtime)=-0.2;
U(4400:simtime)=0.1;
U(4600:simtime)=-0.7;
U(4800:simtime)=-0.6;
U(4900:simtime)=-0.74;


for i=5:simtime
  
   [X(:,i) Y(i)]= Proces(X(:,i-1),U(i-4));

    
end;
plot(U);
hold on;
plot(Y);
hold off;

Uucz=U(1:2500);
Yucz=Y(1:2500);

fid = fopen('dane.txt', 'w');
if fid==-1, error('Cannot open file: %s', 'dane.txt'); end
for i=1:2500
   fprintf(fid, '%f %f\r\n', Uucz(i), Yucz(i));  
end;



Uwer=U(2501:5000);
Ywer=Y(2501:5000);

