load('Dane_Uczace');
load('Dane_Weryfikacyjne');
% y=a0+a1x

Stopien=2;

Uucz=Uucz'; Yucz=Yucz';Uwer=Uwer';Ywer=Ywer';


itEnd =(size(Uucz)) ;
itEnd=itEnd(1);
M=ones(size(Uucz));

k=6;
M=[Uucz(k-4) Uucz(k-5) Yucz(k-1) Yucz(k-2)];
    for k = 7:itEnd
        M=[M;
            Uucz(k-4) Uucz(k-5) Yucz(k-1) Yucz(k-2)];
    end;
Y=Yucz(6:itEnd); 
size(M)
size(Y)
W=M\Y;

%Liczenie punktow
   yp=Yucz; 
   for k=6:itEnd
       yp(k)= W(1)*Uucz(k-4)+W(2)*Uucz(k-5) +  W(3)*yp(k-1)+W(4)*yp(k-2);

   end;  


yp=yp';

%RYSOWANIE
plot(Yucz);
figure(1);
 hold on
 plot(yp);

 legend("dane ucz¹ce","dane z modelu");
 hold off
 buf='Z2B Stopien=';
% buf=[buf mat2str(Stopien) ' ucz'];
 %print(buf,'-dpng','-r500');
 
 
%Weryfikajca
 
itEnd =(size(Uwer)) ;
itEnd=itEnd(1);
yp=Ywer;
   for k=6:itEnd
       yp(k)=W(1)*Uwer(k-4)+W(2)*Uwer(k-5) +  W(3)*yp(k-1)+W(4)*yp(k-2);
    end;
yp=yp';
figure(2);
%close();

 plot(Ywer);
 hold on

 plot(yp);
 legend("dane weryfikujace","wyjscie modelu")
  buf='Z2B Stopien=';
 buf=[buf mat2str(Stopien) ' wer'];
 print(buf,'-dpng','-r500');
 
 hold off
 
  BladWeryfikacji=0;
 for i=1:itEnd-Stopien
    
    BladWeryfikacji=BladWeryfikacji + (Ywer(i)-yp(i))*(Ywer(i)-yp(i));
    
end;
 BladWeryfikacji
