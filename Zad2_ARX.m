
clear all;
close all;
load('Dane_Weryfikacyjne');
load('Dane_Uczace');
dlugosc_danych=2500;
i=7;

name='_ARX_';
    %ustawienia
fid = fopen('ustawienia.txt', 'w');
if fid==-1, error('Cannot open file: %s', 'dane.txt'); end
fprintf(fid, '4 5 2 %d 100 0.00001 2 1\r\n',i);  
    for iterJ=1:10
        system('sieci.exe');
        fix_uczenie        
        uczenie
        model
        liczenie_bledu_uczenia
        
        hold off;
        mkdir(['modele' name 'Ucz/model_' int2str(i) '_']);
        FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
        savefig(FigList,['modele' name 'Ucz/model_' int2str(i) '_' '/_blad_' num2str(Eoe) '_lp_' int2str(iterJ) '_.fig'] ) ;
        close all;
        tmp=['modele' name 'Ucz/model_' int2str(i) '_' '/_blad_' num2str(Eoe) '_lp_' int2str(iterJ) '_'];
        save(tmp);
          
        liczenie_bledu_i_weryfikacja
        
        mkdir(['modele' name 'Wer/model_' int2str(i) '_']);
        FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
        savefig(FigList,['modele' name 'Wer/model_' int2str(i) '_' '/_blad_' num2str(err_wer) '_lp_' int2str(iterJ) '_.fig'] ) ;
        close all;    
        tmp=['modele' name 'Wer/model_' int2str(i) '_' '/_blad_' num2str(err_wer) '_lp_' int2str(iterJ) '_'];
        save(tmp);
        
  
    end;
