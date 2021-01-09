%% DISCRETE FOURIER TRANSFORM OF AN AUDIO SIGNAL
%Biological Signal Processing
%Gonzalez Espinosa Yslen Anahi
clc, clear all, close all
%% AUDIO ACQUISITION
Fs=8000; %frequency
% s=audiorecorder(Fs,8,1); %By default 8000 Hz, 8 bits, 1 channel
% disp('Recording...')
% recordblocking(s,2); %Record for 2s
% disp('End of Recording.')
% %% AUDIO CHECK
% x=getaudiodata(s);
% figure(1)
% plot(x)
% sound(x) 
% %% DATA STORAGE IN TXT FILE
% dlmwrite('AudioDFT.txt',x,'precision',3); %The file is stored at the current folder
% x=fscanf(fopen('AudioDFT.txt'),'%f');
% T = 1/Fs; %Sampling period      
% t =(0:length(x)-1)*T; %Time vector
% figure()
% subplot(3,1,1);
% plot(t,x); xlabel('Time'); ylabel('Audio Signal'); 
% xlim([0,2]); ylim([min(x)*1.1 max(x)*1.1]);

%% 
%xn=fscanf(fopen('AudioDFT.txt'),'%f');
xn=[0, 0.707, 1, .707, 0, -.707, -1, -.707];
N=8;
%N=input("Value of N (total of sampling data): \n");
L=length(xn)
if(N<L)
    disp("N must be equal or greater than the number of data in the signal")
end
xn=[xn zeros(1,N-L)];
for k=0:N-1
    for n=0:N-1
        Wn=exp(-j*2*pi*k*n/N);
        X1(k+1,n+1)=Wn;
    end
end
Xk=X1*xn';

%Freq=(1/T)/2;
Freq=4;
k=0:N-1;
figure()
subplot(3,1,1)
t=0:0.01:1;
t2=linspace(0,7/8,8);
plot(t,sin(2*pi*t))
hold on
plot(t2,xn, 'xr')
xlabel('t')
ylabel('A')
title('Original Signal with sampling points')
subplot(3,1,2)
stem(0:Freq,abs(Xk(1:Freq++1)))
xlabel('k')
ylabel('|Xk|')
title('MagX[k]')
subplot(3,1,3)
stem(0:Freq,angle(Xk(1:Freq+1)))
xlabel('k')
ylabel('angle(Xk)')
title('PhaseX[k]')