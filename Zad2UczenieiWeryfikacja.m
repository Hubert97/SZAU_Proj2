clear all;
close all;
load('Dane_Weryfikacyjne');
load('Dane_Uczace');
dlugosc_danych=2500;
for i=7:7
    %ustawienia
fid = fopen('ustawienia.txt', 'w');
if fid==-1, error('Cannot open file: %s', 'dane.txt'); end
fprintf(fid, '4 5 2 %d 400 0.00001 2 2\r\n',i);  
    for iterJ=1:10
        system('sieci.exe');
        fix_uczenie        
        uczenie
        model
        liczenie_bledu_uczenia
        
        hold off;
        mkdir(['modeleUcz/model_' int2str(i) '_']);
        FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
        savefig(FigList,['modeleUcz/model_' int2str(i) '_' '/_blad_' num2str(Eoe) '_lp_' int2str(iterJ) '_.fig'] ) ;
        close all;
        tmp=['modeleUcz/model_' int2str(i) '_' '/_blad_' num2str(Eoe) '_lp_' int2str(iterJ) '_.mat'];
        save(tmp);
          
        liczenie_bledu_i_weryfikacja
        
        mkdir(['modeleWer/model_' int2str(i) '_']);
        FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
        savefig(FigList,['modeleWer/model_' int2str(i) '_' '/_blad_' num2str(err_wer) '_lp_' int2str(iterJ) '_.fig'] ) ;
        close all;    
        tmp=['modeleWer/model_' int2str(i) '_' '/_blad_' num2str(err_wer) '_lp_' int2str(iterJ) '_.mat'];
        save(tmp);
        
  
    end;
end;