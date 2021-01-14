        Usw1=0;
        Usw2=0;
        Ysw1=0;
        Ysw2=0;
        if i<5
        Usw1=U_obiekt(k-5+i);
        else
        Usw1= U_obiekt(k-1);
        end;
        
        if i<6
        Usw2=U_obiekt(k-6+i); 
        else
        Usw2=U_obiekt(k-1);
        
        end;
        if i<2
        Ysw1=Y_obiekt(k-2+i);
        else
        Ysw1=Y0(i-1);
        end;
        
        if i<3
        Ysw2=Y_obiekt(k-3+i);
        else
        Ysw2=Y0(i-2);
        end;