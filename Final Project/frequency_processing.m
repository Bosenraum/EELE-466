function w = fcn(shift,f)

if shift > 0
    logshift = floor(log(double(shift)));
else
    logshift = -1*floor(log(double(abs(shift))));
end

N = length(f);
Nd2 = N/2;
w = fi(complex(zeros(N,1)), 1, 28, 24);

if shift == 0
    w = f;
else
    w(1)     = fi(complex(0), 1 , 28, 24);
    w(Nd2+1) = fi(complex(0), 1 , 28, 24);
    
    if shift > 0  % increase the frequencies
        for i=2:Nd2
            if i <= shift
                w(i) = fi(complex(0), 1 , 28, 24); % fill in vacated positive frequencies with zeros
            else
                w(i) = f(i-logshift);
            end
        end
        for i=N:-1:Nd2+2
            if i > N-shift
                w(i) = fi(complex(0), 1 , 28, 24);
            else
                w(i) = f(i+logshift);
            end
        end
    end
    
    if shift < 0  % decrease the frequencies
        
        for i=Nd2:-1:2
            if i > Nd2 + shift
                w(i) = fi(complex(0), 1 , 28, 24);
            else
                w(i) = f(i-logshift);
            end
        end
        
        for i=Nd2+2:N
            if i <= Nd2 + 2 - shift
                w(i) = fi(complex(0), 1 , 28, 24);
            else
                w(i) = f(i+logshift);
            end
        end
    end
end
end