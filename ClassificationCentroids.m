%% CLASSIFICATION WITH CENTROIDS
%Biological Signal Processing
%Gonzalez Espinosa Yslen Anahi
clc, clear all, close all
%% PLOTTING POINT FOR EACH CLASS
n=input('Number of data for each class: ');
% n random elements for class 1
x1=30+60*rand(n,1);
y1=20*rand(n,1);
% n random elements for class 2
x2=20*rand(n,1);
y2=30+60*rand(n,1);
% n random elements for class 3
x3=40+10*rand(n,1);
y3=30+60*rand(n,1);
% Plot of the random elements
hold on
plot(x1,y1,'ob')
plot(x2,y2,'or')
plot(x3,y3,'og')
xlabel('Feature 1')
ylabel('Feature 2')
legend('Class 1', 'Class 2', 'Class 3')
%% OBTAINING CENTROIDS 
% For class 1
cx1=sum(x1)/n;
cy1=sum(y1)/n;
plot(cx1,cy1,'*b')
% For class 2
cx2=sum(x2)/n;
cy2=sum(y2)/n;
plot(cx2, cy2,'*r')
% For class 3
cx3=sum(x3)/n;
cy3=sum(y3)/n;
plot(cx3,cy3,'*g')
legend('Class 1', 'Class 2', 'Class 3','Centroid of Class 1', 'Centroid of Class 2', 'Centroid of Class 3')
%% CLASSIFICATION
% Entering a new value
xn=input('X value for the new data: ');
yn=input('Y value for the new data: ');
plot(xn,yn,'ok')
% Obtaining the distance between centroids of each class and the new data
dc1=sqrt((xn-cx1)^2+(yn-cy1)^2);
dc2=sqrt((xn-cx2)^2+(yn-cy2)^2);
dc3=sqrt((xn-cx3)^2+(yn-cy3)^2);
% Obtaining the minimum distance
dm=[dc1,dc2,dc3];
class=min(dm);
%% RESULTS & NETWORK LEARNING
if class==dc1
    disp('The new data is in Class 1')
    x1(end+1)=xn;
    y1(end+1)=yn;
    % New Centroid
    cx1=sum(x1)/(n+1);
    cy1=sum(y1)/(n+1);
    plot(cx1,cy1,'xb')
elseif class == dc2
    disp('The new data is in Class 2')
    x2(end+1)=xn;
    y2(end+1)=yn;
    % New Centroid
    cx2=sum(x2)/(n+1);
    cy2=sum(y2)/(n+1);
    plot(cx2,cy2,'xr')   
elseif class==dc3
    disp('The new data is in Class 3')
    x3(end+1)=xn;
    y3(end+1)=yn;
    % New Centroid
    cx3=sum(x3)/(n+1);
    cy3=sum(y3)/(n+1);
    plot(cx3,cy3,'xg')
end
legend('Class 1', 'Class 2', 'Class 3','Centroid of Class 1', 'Centroid of Class 2', 'Centroid of Class 3','New data','New centroid')