clear all;clc;close all
bd=xlsread('BasedeDatos.xlsx');
Energia = zeros(80,35);
for i=1:80
    A=bd(i,:);
    fs=8000;
    l=length(A);
    
    xn=highpass(A,250,fs); %Pasa altas de 250Hz
    maximo=max(abs(xn));
    xn=xn/maximo; %Normalizacion de la señal
    senal=xn(abs(xn)>0.05); %Recorte de la parte de interes en senal
    
    %Se obtienen los cruces por 0 en d
    a=senal>0;
    b=a(2:end);
    c=a(1:end-1)-b;
    d=find(c);

    %Obtencion de energia en los intervalos de cruce por 0
    val = 1;
    for j=1:length(d)
        %La ventana sera desde el valor hasta el siguiente cruce por 0
        ventana = senal(val:d(j));
        T=1+d(j)-val;
        % Calculo de energia
        E(j)=sumsqr(ventana)/T;
        %La siguiente ventana empezara del siguiente valor
        val = d(j)+1;
    end
    %La ultima ventana ira desde el valor hasta el fin de la señal
    ventana = senal(val:end);
    T=1+length(senal)-val;
    E(end+1)=sumsqr(ventana)/T;
    E=E(E>0.035); %Se eliminan los valores de energía muy pequeños
%     figure()
%     plot(E)

    %Obtencion del patron de distribucion de la energia a lo largo de la señal
    AEZI=[];
    int=0.02; % Intervalo para la distribución
    for j=0:int:(0.7-int) %0.7 es el valor máximo de energía encontrado
        AEZI(end+1)=sum(E>j & E<(j+int));
    end
%     figure()
%     plot(AEZI)
    Energia(i,:)=AEZI; %Patron de distribucion de energía para las 80 señales
end
