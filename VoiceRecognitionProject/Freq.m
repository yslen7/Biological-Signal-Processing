clear,clc
bd=xlsread('BasedeDatosTest.xlsx');
for i=1:32
    A=bd(i,:);
    % sound(A);
    %pause(2);
    fs=8000;
    l=length(A);
    NFFT=2^nextpow2(l);
    Y=fft(A,NFFT)/l;
    f=fs/2*linspace(0,1,NFFT/2+1);
    max(2*abs(Y(1:NFFT/2+1)));
    k(i)=find(2*abs(Y(1:NFFT/2+1))==max(2*abs(Y(1:NFFT/2+1))));
    
    if i<=8
        subplot(4,1,1),hold on
        plot(f,2*abs(Y(1:NFFT/2+1))), title('JESUS')
    elseif i>=9 && i<=16
        subplot(4,1,2),hold on
        plot(f,2*abs(Y(1:NFFT/2+1))), title('TIBU')
    elseif i>=17 && i<=24
        subplot(4,1,3),hold on
        plot(f,2*abs(Y(1:NFFT/2+1))), title('ARI')
    else
        subplot(4,1,4),hold on
        plot(f,2*abs(Y(1:NFFT/2+1))), title('YS')
    end
end
%%
foJ=mean(k(1:8));
foT=mean(k(9:16));
foA=mean(k(17:24));
foY=mean(k(25:32));
