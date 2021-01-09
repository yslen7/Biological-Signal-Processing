clc, clear, close all
%% Armónicos de una señal cuadrada
t=0:0.01:5*2*pi;
f1=(4/pi)*sin(t);
f3=(4/(3*pi))*sin(3*t);
f5=(4/(5*pi))*sin(5*t);
f7=(4/(7*pi))*sin(7*t);
figure,plot(t, f1)
hold on
plot(t, f3)
plot(t, f5)
plot(t, f7)
F=f1+f3+f5+f7; %Suma de los armónicos
plot(t,F)
legend('f1','f3','f5','f7','F')
figure,plot(t,f1)
hold on
plot(t,f1+f3)
plot(t,f1+f3+f5)
plot(t,F)
title('Suma de armónicos por cada iteración')
%Se observa como cada vez se aproxima más a la función cuadrada original
legend('f1','f1+f3','f1+f3+f5','f1+f3+f5+f7')
%% Programa para graficar 100 armónicos
N=100;
for (n=1:N)
    f(n,:)=(2*(1-cos(n*pi))/(n*pi))*sin(n*t);
end
F2=sum(f);
figure, plot(t,F2)
title('100 armónicos')
%% Programa Fasores
t=0:0.1:2*pi;
x=cos(t);
y=sin(t);
plot3(x,y,t)
xlabel('x')
ylabel('y')
zlabel('t')
figure
plot3(x,y,t,'o')
xlabel('x')
ylabel('y')
zlabel('t')
for k=1:63
    T(2*k-1)=t(k);
    Y(2*k-1)=y(k);
    X(2*k-1)=x(k);
end
plot3(X,Y,T)
hold on
plot3(X,Y,T,'o')
xlabel('x')
ylabel('y')
zlabel('t')
z=[0:0.05:5];
figure
plot3(cos(2*pi*z), sin(2*pi*z),z)