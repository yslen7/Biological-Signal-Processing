function varargout = Prac2_Fourier(varargin)
% PRAC2_FOURIER MATLAB code for Prac2_Fourier.fig
%      PRAC2_FOURIER, by itself, creates a new PRAC2_FOURIER or raises the existing
%      singleton*.
%
%      H = PRAC2_FOURIER returns the handle to a new PRAC2_FOURIER or the handle to
%      the existing singleton*.
%
%      PRAC2_FOURIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAC2_FOURIER.M with the given input arguments.
%
%      PRAC2_FOURIER('Property','Value',...) creates a new PRAC2_FOURIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prac2_Fourier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prac2_Fourier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prac2_Fourier

% Last Modified by GUIDE v2.5 11-Nov-2020 18:31:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prac2_Fourier_OpeningFcn, ...
                   'gui_OutputFcn',  @Prac2_Fourier_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Prac2_Fourier is made visible.
function Prac2_Fourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prac2_Fourier (see VARARGIN)

% Choose default command line output for Prac2_Fourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Prac2_Fourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Prac2_Fourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Valorn_Callback(hObject, eventdata, handles)
% hObject    handle to Valorn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Valorn as text
%        str2double(get(hObject,'String')) returns contents of Valorn as a double


% --- Executes during object creation, after setting all properties.
function Valorn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Valorn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartButton.
function StartButton_Callback(hObject, eventdata, handles)
% hObject    handle to StartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=str2num(get(handles.Valorn,'String'));
F=str2num(get(handles.ValorFreq,'String'));
t=-1:0.01:1;
%% Graphs
axes(handles.GrafRampa);
unitstep = t>=0; 
ramp = t.*unitstep;
hold off
plot(t,ramp,'LineWidth',2)
title('Ramp Signal')
hold on

axes(handles.GrafSierra);
hold off
plot(t,sawtooth(2*pi*t*F),'LineWidth',2)
title('Sawtooth Signal')
hold on

axes(handles.GrafExponencial);
hold off
plot(t,exp(t),'LineWidth',2)
title('Exponential Signal')
hold on

fun = @(t) t.*(t>=0);
a(1) = (1/pi) * integral(fun, -pi, pi);
S = a(1)/2;

fun2 = @(t) sawtooth(2*pi*t*F);
a2(1) = (1/pi) * integral(fun2, -pi, pi);
S2 = a2(1)/2;

fun3 = @(t) exp(t);
a3(1)= (1/pi) * integral(fun3, -pi, pi);
S3 = a3(1)/2;
% 
% ArmonicosRampa=[0:n];
% ArmonicosSierra=[0:n];
% ArmonicosExp=[0:n];
% 
% ArmonicosRampa(1)=a0;
% ArmonicosSierra(1)=a02;
% ArmonicosExp(1)=a03;
for i = 1:n
    %% For Ramp Signal
    fun = @(t) t.*(t>=0).*cos(i.*t);
    a(i+1) = (1/pi) * integral(fun, -pi, pi);
    fun = @(t) t.*(t>=0).*sin(i.*t);
    b(i+1) = (1/pi) * integral(fun, -pi, pi);
    S = S + a(i+1).*cos(i.*t) + b(i+1).*sin(i.*t);
    %% For Sawtooth Signal
    fun2 = @(t) sawtooth(2*pi.*t*F).*cos(i.*t);
    a2(i+1) = (1/pi) * integral(fun2, -pi, pi);
    fun2 = @(t) sawtooth(2*pi.*t*F).*sin(i.*t);
    b2(i+1) = (1/pi) * integral(fun2, -pi, pi);
    S2 = S2 + a2(i+1).*cos(i.*t) + b2(i+1).*sin(i.*t);
    %% For Exponential Signal
    fun3 = @(t) exp(t).*cos(i.*t);
    a3(i+1) = (1/pi) * integral(fun3, -pi, pi);
    fun3 = @(t) exp(t).*sin(i.*t);
    b3(i+1) = (1/pi) * integral(fun3, -pi, pi);
    S3 = S3 + a3(i+1).*cos(i.*t) + b3(i+1).*sin(i.*t);
    %% Graphs
    axes(handles.GrafRampa);
    hold on
    plot(t,S)
    axes(handles.GrafSierra);
    hold on
    plot(t,S2)
    axes(handles.GrafExponencial);
    hold on
    plot(t,S3)  
end
A_Rampa=a
B_Rampa=b
A_Sierra=a2
B_Sierra=b2
A_Exponencial=a3
B_Exponencial=b3
%% Gráfica Rampa
% axes(handles.GrafRampa);
% unitstep = t>=0; 
% ramp = t.*unitstep;
% hold off
% plot(t,ramp,'LineWidth',2)
% title('Ramp Signal')
% fun = @(t) t.*(t>=0);
% a0 = (1/pi) * integral(fun, -pi, pi);
% S = a0/2;
% hold on
% for i = 1:n
%     fun = @(t) t.*(t>=0).*cos(i.*t);
%     a(i) = (1/pi) * integral(fun, -pi, pi);
%     fun = @(t) t.*(t>=0).*sin(i.*t);
%     b(i) = (1/pi) * integral(fun, -pi, pi);
%     S = S + a(i).*cos(i.*t) + b(i).*sin(i.*t);
%     plot(t,S)
% end
%% Gráfica Sierra
% axes(handles.GrafSierra);
% fun = @(t) sawtooth(2*pi*t*F);
% a0 = (1/pi) * integral(fun, -pi, pi);
% S = a0/2;
% hold off
% plot(t,sawtooth(2*pi*t*F),'LineWidth',2)
% title('Sawtooth Signal')
% hold on
% for i = 1:n
%     fun = @(t) sawtooth(2*pi*t*F).*cos(i.*t);
%     a(i) = (1/pi) * integral(fun, -pi, pi);
%     fun = @(t) sawtooth(2*pi*t*F).*sin(i.*t);
%     b(i) = (1/pi) * integral(fun, -pi, pi);
%     S = S + a(i).*cos(i.*t) + b(i).*sin(i.*t);
%     plot(t,S)
% end
%% Gráfica Exponencial
% axes(handles.GrafExponencial);
% fun = @(t) exp(t);
% a0 = (1/pi) * integral(fun, -pi, pi);
% S = a0/2;
% hold off
% plot(t,exp(t),'LineWidth',2)
% title('Exponential Signal')
% hold on
% for i = 1:n
%     fun = @(t) exp(t).*cos(i.*t);
%     a(i) = (1/pi) * integral(fun, -pi, pi);
%     fun = @(t) exp(t).*sin(i.*t);
%     b(i) = (1/pi) * integral(fun, -pi, pi);
%     S = S + a(i).*cos(i.*t) + b(i).*sin(i.*t);
%     plot(t,S)
% end

function ValorFreq_Callback(hObject, eventdata, handles)
% hObject    handle to ValorFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ValorFreq as text
%        str2double(get(hObject,'String')) returns contents of ValorFreq as a double


% --- Executes during object creation, after setting all properties.
function ValorFreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ValorFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
