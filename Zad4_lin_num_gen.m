     % B3   
        qk=[U_obiekt(k-4)+delta_linearyzacji U_obiekt(k-5) Y_obiekt(k-1) Y_obiekt(k-2) ]';
        Ymod_d=w20+w2*tanh(w10+w1*qk);
        qk=[U_obiekt(k-4) U_obiekt(k-5) Y_obiekt(k-1) Y_obiekt(k-2) ]';
        Ymod=w20+w2*tanh(w10+w1*qk);
    b3=(Ymod_d-Ymod)/delta_linearyzacji;
     % B4
        
        qk=[U_obiekt(k-4) U_obiekt(k-5)+delta_linearyzacji Y_obiekt(k-1) Y_obiekt(k-2) ]';
        Ymod_d=w20+w2*tanh(w10+w1*qk);
        qk=[U_obiekt(k-4) U_obiekt(k-5) Y_obiekt(k-1) Y_obiekt(k-2) ]';
        Ymod=w20+w2*tanh(w10+w1*qk);
    b4=(Ymod_d-Ymod)/delta_linearyzacji;
    % A1
        qk=[U_obiekt(k-4) U_obiekt(k-5) Y_obiekt(k-1)+delta_linearyzacji Y_obiekt(k-2) ]';
        Ymod_d=w20+w2*tanh(w10+w1*qk);
        qk=[U_obiekt(k-4) U_obiekt(k-5) Y_obiekt(k-1) Y_obiekt(k-2) ]';
        Ymod=w20+w2*tanh(w10+w1*qk);    
    a1=(Ymod_d-Ymod)/delta_linearyzacji;
    % A2
    qk=[U_obiekt(k-4) U_obiekt(k-5) Y_obiekt(k-1) Y_obiekt(k-2)+delta_linearyzacji ]';
    Ymod_d=w20+w2*tanh(w10+w1*qk);
    qk=[U_obiekt(k-4) U_obiekt(k-5) Y_obiekt(k-1) Y_obiekt(k-2) ]';
    Ymod=w20+w2*tanh(w10+w1*qk);
    a2=(Ymod_d-Ymod)/delta_linearyzacji;