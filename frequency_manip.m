function w = fcn(f)

N = length(f);
Nd2 = N/2;
w = fi(complex(zeros(N,1)), 1, 28, 24);

w(1)     = fi(complex(0), 1 , 28, 24);
w(Nd2+1) = fi(complex(0), 1 , 28, 24);
     
    for i=2:Nd2
        modulus = mod(i,5);
        if modulus == 1
            w(i) = fi(complex(0),1,28,24);
        elseif modulus == 2
            w(i) = fi(complex(0),1,28,24);
        elseif modulus == 3
            w(i) = fi(complex(0),1,28,24);
        elseif modulus == 4
            w(i) = fi(complex(0),1,28,24);
        else
            w(i) = f(i);
        end
    end

    for i=N:-1:Nd2+2
       modulus = mod(i,5);
       if modulus == 1
           w(i) = fi(complex(0),1,28,24);
       elseif modulus == 2
           w(i) = fi(complex(0),1,28,24);
       elseif modulus == 3
           w(i) = fi(complex(0),1,28,24);
       elseif modulus == 4
            w(i) = fi(complex(0),1,28,24);
       else
           w(i) = f(i);
       end
    end
end