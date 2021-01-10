        fid = fopen('uczenie.m', 'r') ;              % Open source file.
        fgetl(fid) ;                                  % Read/discard line.
        fgetl(fid) ;                                  % Read/discard line.
        buffer = fread(fid, Inf) ;                    % Read rest of the file.
        fclose(fid);
        fid = fopen('uczenie.m', 'w')  ;   % Open destination file.
        fwrite(fid, buffer) ;                         % Save to file.
        fclose(fid) ;