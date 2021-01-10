clear all;
close all;
for i=1:10
    %ustawienia
fid = fopen('ustawienia.txt', 'w');
if fid==-1, error('Cannot open file: %s', 'dane.txt'); end
fprintf(fid, '4 5 2 %d 100 0.00001 2 2\r\n',i);  
    for iterJ=1:10
        system('sieci.exe');
        fix_uczenie        
        uczenie
        model
        mkdir(['modele/model_' int2str(i) '_']);
        FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
        savefig(FigList,['modele/model_' int2str(i) '_' '/_blad_' num2str(Eoe) '_lp_' int2str(iterJ) '_.fig'] ) ;
        close all;
        tmp=['modele/model_' int2str(i) '_' '/_blad_' num2str(Eoe) '_lp_' int2str(iterJ) '_'];
        save(tmp);
    end;
end;