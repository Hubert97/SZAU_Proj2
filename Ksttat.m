simtime=2000;

X=zeros(2,simtime);
U=zeros(1,simtime);
Y=zeros(1,simtime);

U(2:simtime)=-0.5;
Kstat=zeros(2,2000);
ii=0;
for i=-1:0.001:1
    ii=ii+1;
  U(2:simtime)=i;
  for iii=5:simtime
   [X(:,iii) Y(iii)]= Proces(X(:,iii-1),U(iii-4));
  end;
    Kstat(:,ii)=[i Y(simtime)];
end;
plot(Kstat(1,:),Kstat(2,:));
