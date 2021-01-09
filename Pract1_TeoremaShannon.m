%% PRÁCTICA 1: TEOREMA DE SHANNON
% Procesamiento de señales biológicas
close all; clear all; clc;
%% Obtención del audio
% disp('Diga algo...')
% S = audiorecorder(48000, 8, 1);
% recordblocking(S, 5);
% disp('La grabación terminó');
% x = getaudiodata(S);
% archivo = sprintf('Audio.txt');
% dlmwrite(archivo, x, 'precision', 3);
% audiowrite('Audio1.mp4',x,48000);
%% Graficación de las señales
% Señal de audio
[y5, Fs]=audioread('Audio1.mp4'); %Leemos el audio       
T = 1/Fs; %Periodo de muestreo       
t =(0:length(y5)-1)*T; %Vector tiempo
figure(5)
subplot(3,1,1);
plot(t,y5); xlabel('Tiempo'); ylabel('Señal de audio'); 
xlim([0,5]); ylim([min(y5)*1.1 max(y5)*1.1]);
F=input('Ingrese la frecuencia de la función sen,cos,sierra: ');
% Función seno
y1 = sin(2*pi*F*t);
figure(1)
subplot(3,1,1);
plot(t,y1); xlabel('Tiempo'); ylabel('Función seno');
xlim([0,5]); ylim([min(y1)*1.1 max(y1)*1.1]);
% Función coseno
y2 = cos(2*pi*F*t);
figure(2)
subplot(3,1,1);
plot(t,y2); xlabel('Tiempo'); ylabel('Función coseno'); 
xlim([0,5]); ylim([min(y2)*1.1 max(y2)*1.1]);
% Función sierra
y3 = sawtooth(2*pi*F*t);
figure(3)
subplot(3,1,1);
plot(t,y3); xlabel('Tiempo'); ylabel('Función de sierra'); 
xlim([0,5]); ylim([min(y3)*1.1 max(y3)*1.1]);
% Ruido
k=[1:length(y5)];
m=0.52*sin(2*pi*k/3 + pi/2);  %Generación del ruido
y4=m+y5(:,1)'; %Suma de la señal original más el ruido
figure(4)
subplot(3,1,1);
plot(t,y4); xlabel('Tiempo'); ylabel('Ruido');
xlim([0,5]); ylim([min(y4)*1.1 max(y4)*1.1]);
%% Muestreo de las señales
T=input('Ingrese el periodo de muestreo deseado: ');
n=input('¿Cuántos puntos desea graficar?: ');
a=input('¿Desde qué instante desea empezar (Valor entre 0 a 5)?: ');
for i=1:n
    k=a+i*T;
    if (k)>5 %Nuestras muestras solo son de 5 segundos
        disp('No hay suficientes puntos para mostrar');
        break;
    end
    tt(i)=k;
    Y1(i) = sin(2*pi*F*k);
    Y2(i) = cos(2*pi*F*k);
    Y3(i) = sawtooth(2*pi*F*k);
    j=find(abs(t-(k)) < 0.00001); %Buscamos el valor para ese Ts
    Y4(i) = y4(j);
    Y5(i) = y5(j);
end
%% Graficación de los puntos muestreados y gráficas 
% Función seno
figure(1)
subplot(3,1,2);
plot(tt,Y1,'.r'); 
hold on; bar(tt,Y1,0.1);
('Tiempo'); ylabel('Función seno');
xlim([0,5]); ylim([min(y1)*1.1 max(y1)*1.1]);
subplot(3,1,3);
plot(t,y1,tt,Y1,'.r'); xlabel('Tiempo'); ylabel('Función seno');
xlim([0,5]); ylim([min(y1)*1.1 max(y1)*1.1]);
% Función coseno
figure(2)
subplot(3,1,2);
plot(tt,Y2,'.r');
hold on; bar(tt,Y2,0.1);
xlabel('Tiempo'); ylabel('Función coseno'); 
xlim([0,5]); ylim([min(y2)*1.1 max(y2)*1.1]);
subplot(3,1,3);
plot(t,y2,tt,Y2,'.r'); xlabel('Tiempo'); ylabel('Función coseno');
xlim([0,5]); ylim([min(y2)*1.1 max(y2)*1.1]);
% Función sierra
figure(3)
subplot(3,1,2);
plot(tt,Y3,'.r'); 
hold on; bar(tt,Y3,0.1);
xlabel('Tiempo'); ylabel('Función de sierra'); 
xlim([0,5]); ylim([min(y3)*1.1 max(y3)*1.1]);
subplot(3,1,3);
plot(t,y3,tt,Y3,'.r'); xlabel('Tiempo'); ylabel('Función de sierra');
xlim([0,5]); ylim([min(y3)*1.1 max(y3)*1.1]);
% Ruido
figure(4)
subplot(3,1,2);
plot(tt,Y4,'.r'); 
hold on; bar(tt,Y4,0.1);
xlabel('Tiempo'); ylabel('Ruido');
xlim([0,5]); ylim([min(y4)*1.1 max(y4)*1.1]);
subplot(3,1,3);
plot(t,y4,tt,Y4,'.r'); xlabel('Tiempo'); ylabel('Ruido');
xlim([0,5]); ylim([min(y4)*1.1 max(y4)*1.1]);
% Audio
figure(5)
subplot(3,1,2);
plot(tt,Y5,'.r'); 
hold on; bar(tt,Y5,0.1);
xlabel('Tiempo'); ylabel('Audio');
xlim([0,5]); ylim([min(y5)*1.1 max(y5)*1.1]);
subplot(3,1,3);
plot(t,y5,tt,Y5,'.r'); xlabel('Tiempo'); ylabel('Audio');
xlim([0,5]); ylim([min(y5)*1.1 max(y5)*1.1]); 
%% Cálculo del teorema de shannon
if (1/T>2*F)
    disp('El periodo de muestreo cumple el teorema de shannon para');
    disp('la función seno, coseno y sierra');  
else
    disp('El periodo de muestreo NO cumple el teorema de shannon para');
    disp('la función seno, coseno y sierra');  
end
if (1/T>2*Fs)
    disp('El periodo de muestreo cumple el teorema de shannon para');
    disp('el audio y el ruido');   
else
    disp('El periodo de muestreo NO cumple el teorema de shannon para');
    disp('el audio y el ruido'); 
end