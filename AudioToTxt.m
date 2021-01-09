%% AUDIO EXTRACTION AND PLAYBACK
%Biological Signal Processing
%Gonzalez Espinosa Yslen Anahi
%% AUDIO ACQUISITION
clc, clear all, close all
Fs=8000; %frequency
s=audiorecorder(Fs,8,1); %By default 8000 Hz, 8 bits, 1 channel
disp('Recording...')
recordblocking(s,2); %Record for 5s
disp('End of Recording.')
%% AUDIO CHECK
x=getaudiodata(s);
figure(1)
plot(x)
sound(x) 
%% DATA STORAGE IN TXT FILE
dlmwrite('ycomo1.txt',x,'precision',3); %The file is stored at the current folder
%% READING TXT FILE
disp('Select your .txt file of the audio signal')
[file,path]=uigetfile('*.txt');
Freq=input('What is the frequency(Hz)? ');
signal=fscanf(fopen([path,file]),'%f');
figure(2)
plot((1:length(signal))/Freq,signal)