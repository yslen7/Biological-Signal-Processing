%% READING .TXT AUDIO FILE
% Biological Signal Processing
% González Espinosa Yslen Anahí
clc, clear all, close all
%% ASKING FOR FREQUENCY
Fs=input('What is the sampling frequency(Hz) of the audio signal? ');
%% SELECTION OF FILE
disp('Select your .txt file of the audio signal')
[file,path]=uigetfile('*.txt');
%% READING THE SIGNAL AT THE TXT FILE
signal=fscanf(fopen([path,file]),'%f');
%% PLOTTING OF RESULT
figure(1)
plot((1:length(signal))/Fs,signal)
title('Audio Signal'), xlabel('Time in s'), ylabel('Amplitude')