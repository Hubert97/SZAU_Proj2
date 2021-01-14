load('Dane_Uczace');
load('Dane_Weryfikacyjne');
% y=a0+a1x

Stopien=2
Uucz=Uucz'; Yucz=Yucz';Uwer=Uwer';Ywer=Ywer';


itEnd =(size(Uucz)) ;
itEnd=itEnd(1);
M=ones(size(Uucz));

if Stopien == 1

    M=[Uucz(2-Stopien) Yucz(2-Stopien)];
        
    for k = 3:itEnd
    
        M=[M;
            Uucz(k-Stopien) Yucz(k-Stopien)];
        
    end;
    
Y=Yucz(2:itEnd);

elseif Stopien==2
    
    
     M=[Uucz(3-Stopien+1) Uucz(3-Stopien) Yucz(3-Stopien+1) Yucz(3-Stopien)];
    
    for k = 4:itEnd
    
        M=[M;
            Uucz(k-Stopien+1) Uucz(k-Stopien) Yucz(k-Stopien+1) Yucz(k-Stopien)];
        
    end;
        
        
Y=Yucz(Stopien+1:itEnd);  

elseif Stopien==3
            
     M=[Uucz(4-Stopien+2) Uucz(4-Stopien+1) Uucz(4-Stopien) Yucz(4-Stopien+2) Yucz(4-Stopien+1) Yucz(4-Stopien)];
    
    for k = 5:itEnd
    
        M=[M;
           Uucz(k-Stopien+2) Uucz(k-Stopien+1) Uucz(k-Stopien) Yucz(k-Stopien+2) Yucz(k-Stopien+1) Yucz(k-Stopien)];
        
    end;
        
        
Y=Yucz(Stopien+1:itEnd);  

end;
        
        

W=M\Y;


%Liczenie punktow

if Stopien ==1
yp= W(1)*Uucz(1)+W(2)*Yucz(1) ;
    for k=Stopien+2:itEnd
       yp=[yp W(1)*Uucz(k-Stopien) + W(2)*Yucz(k-Stopien)];
    end;

elseif Stopien==2
    
yp= W(1)*Uucz(2)+W(2)*Uucz(1)+W(3)*Yucz(2)+W(4)*Yucz(1);
   for k=Stopien+2:itEnd
       yp=[yp W(1)*Uucz(k-Stopien+1)+W(2)*Uucz(k-Stopien) +  W(3)*Yucz(k-Stopien+1)+W(4)*Yucz(k-Stopien)];
    end;
    
elseif Stopien==3
    yp= W(1)*Uucz(3)+W(2)*Uucz(2)+W(3)*Uucz(1) +W(4)*Yucz(3)+ W(5)*Yucz(2)+W(6)*Yucz(1);
   for k=Stopien+2:itEnd
       yp=[yp W(1)*Uucz(k-Stopien+2)+W(2)*Uucz(k-Stopien+1)+W(3)*Uucz(k-Stopien) +  W(4)*Yucz(k-Stopien+2)+W(5)*Yucz(k-Stopien+1)+W(6)*Yucz(k-Stopien)];
    end;
    
end;

yp=yp';

%RYSOWANIE
plot(Yucz);
figure(1);
 hold on
 plot(Ywer);
 plot(yp);

 legend("dane ucz¹ce","dane weryfikujace","wyjscie modelu");
 hold off
 buf='Z2B Stopien=';
 buf=[buf mat2str(Stopien) ' ucz'];
 print(buf,'-dpng','-r500');
 
 
 %Liczenie b³êdu
 BladUczenia=0;
 for i=1:itEnd-Stopien
    BladUczenia=BladUczenia+(Yucz(i+Stopien)-yp(i))*(Yucz(i+Stopien)-yp(i));
    
end;
 BladUczenia=BladUczenia/(itEnd-Stopien)
 
 
 
 
 
 
 
 
 %Weryfikajca
 
 
itEnd =(size(Uwer)) ;
itEnd=itEnd(1);



if Stopien ==1
yp= W(1)*Uwer(1)+W(2)*Ywer(1) ;
    for k=Stopien+2:itEnd
       yp=[yp (W(1)*Uwer(k-Stopien)+ W(2)*Ywer(k-Stopien))];
    end;

elseif Stopien==2
    
yp= W(1)*Uwer(2)+W(2)*Uwer(1)+W(3)*Ywer(2)+W(4)*Ywer(1);
   for k=Stopien+2:itEnd
       yp=[yp W(1)*Uwer(k-Stopien+1)+W(2)*Uwer(k-Stopien) +  W(3)*Ywer(k-Stopien+1)+W(4)*Ywer(k-Stopien)];
    end;
    
elseif Stopien==3
    yp= W(1)*Uwer(3)+W(2)*Uwer(2)+W(3)*Uwer(1) +W(4)*Ywer(3)+ W(5)*Ywer(2)+W(6)*Ywer(1);
   for k=Stopien+2:itEnd
       yp=[yp W(1)*Uwer(k-Stopien+2)+W(2)*Uwer(k-Stopien+1)+W(3)*Uwer(k-Stopien) +  W(4)*Ywer(k-Stopien+2)+W(5)*Ywer(k-Stopien+1)+W(6)*Ywer(k-Stopien)];
    end;
    
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
 BladWeryfikacji=BladWeryfikacji/(itEnd-Stopien)
