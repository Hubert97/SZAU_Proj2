
%symulowanie 
err_ucz=0;
Ymod=zeros(1,dlugosc_danych);
Ymod(1:6)=Yucz(1:6);
for iii=6:dlugosc_danych
    
    qk=[Uucz(iii-4) Uucz(iii-5) Ymod(iii-1) Ymod(iii-2) ]';
    Ymod(iii)=w20+w2*tanh(w10+w1*qk);
    %suma bledu 
    err_ucz=err_ucz+(Ymod(iii)-Yucz(iii))^2;
end;
err_ucz


figure; plot(Ymod,'b'); hold on; plot(Yucz,'r'); xlabel('Iteracje'); ylabel('Dane z modelu, Dane Uczace'); legend('Ymod','Yucz'); title('Weryfikacja modelu OE');
figure; plot(Uwer); xlabel('Iteracje'); ylabel('U zadane.');


