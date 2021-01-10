%symulowanie 
load('Z4_Wybranymodel\_blad_2.146_lp_3_.mat')
dlugosc_danych=2500;
err_wer=0;
Ymod=zeros(1,dlugosc_danych);
Ymod(1:6)=Ywer(1:6);
for iii=6:dlugosc_danych
    
    qk=[Uwer(iii-4) Uwer(iii-5) Ymod(iii-1) Ymod(iii-2) ]';
    Ymod(iii)=w20+w2*tanh(w10+w1*qk);
    %suma bledu 
    err_wer=err_wer+(Ymod(iii)-Ywer(iii))^2;
end;
err_wer


figure; plot(Ymod,'b'); hold on; plot(Ywer,'r'); xlabel('Iteracje'); ylabel('Dane z modelu, Dane Weryfikujace'); legend('Ymod','Ywer'); title('Weryfikacja modelu OE');
figure; plot(Uwer); xlabel('Iteracje'); ylabel('U zadane.');
hold off;
