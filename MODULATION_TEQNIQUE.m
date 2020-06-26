function varargout = MODULATION_TEQNIQUE(varargin)
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%
%MODULATION_TEQNIQUE M-file for AMModDemod_Demo.fig
%      AMMODDEMOD_DEMO, by itself, creates a new MODULATION_TEQNIQUE or raises the existing
%      singleton*.
%
%      H = MODULATION_TEQNIQUE returns the handle to a new MODULATION_TEQNIQUE or the handle to
%      the existing singleton*.
%
%      AMMODDEMOD_DEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODULATION_TEQNIQUE.M with the given input arguments.
%
%      MODULATION_TEQNIQUE('Property','Value',...) creates a new MODULATION_TEQNIQUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MODULATION_TEQNIQUE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MODULATION_TEQNIQUE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MODULATION_TEQNIQUE


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MODULATION_TEQNIQUE_OpeningFcn, ...
                   'gui_OutputFcn',  @MODULATION_TEQNIQUE_OutputFcn, ...
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


% --- Executes just before AMModDemod_Demo is made visible.


function MODULATION_TEQNIQUE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AMModDemod_Demo (see VARARGIN)

% Choose default command line output for AMModDemod_Demo
handles.output = hObject;
  %load handel;
 %handles.player = audioplayer(y, Fs);
 load handel.mat
audiowrite('record1.wav', y ,Fs);
handles.y=y;
% Update handles structure
guidata(hObject, handles);
%  load handel;
% player = audioplayer(y, Fs);
% UIWAIT makes AMModDemod_Demo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MODULATION_TEQNIQUE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(handles.checkbox1, 'Value');
 if ~value
vm=get(handles.slider1,'value'); % Amplitude of Modulating Signal

fm=get(handles.slider2,'value'); % Frequency of Modulating Signal

handles.ejex=0:1/8000:1;
axes(handles.axes1)
set(handles.text3,'string',vm);

set(handles.text4,'string',fm);

 axes(handles.axes1)
v_m=vm*cos(2*pi*fm*handles.ejex); % Modulating Signal Waveform

plot(handles.ejex,v_m,'-','Color',[0 1 0]);%plot am modulating signal
 title('MOD SIGNAL');
ylabel('Amplitude'); 
xlabel('Time (s)'); % Display Modulating Signal
 end
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(handles.checkbox1, 'Value');
 if ~value
vm=get(handles.slider1,'value');

fm=get(handles.slider2,'value');

handles.ejex=0:1/8000:1;
axes(handles.axes1)
set(handles.text3,'string',vm);%show value of vm

set(handles.text4,'string',fm);%show value of fm

% axes(handles.axes1)
v_m=vm*cos(2*pi*fm*handles.ejex);

plot(handles.ejex,v_m,'-','Color',[0 1 0]);
%y_c=cos(2*pi*100*handles.ejex);
% title('Mod SIGNAL');
ylabel('Amplitude');
xlabel('Time (s)');
 end
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
 value = get(handles.checkbox1, 'Value');
 %if ~value
vc=get(handles.slider3,'value'); % Carrier Signal Amplitude
fc=get(handles.slider4,'value');  % Carrier Signal Frequency

handles.ejex=0:1/8000:1;
axes(handles.axes2)
set(handles.text12,'string',vc);
set(handles.text14,'string',fc);
% axes(handles.axes1)
v_c=vc*cos(2*pi*fc*handles.ejex); % Carrier signal Waveform

plot(handles.ejex,v_c,'-','Color',[0 1 0]);
%y_c=cos(2*pi*100*handles.ejex);
% title('CARRIER SIGNAL');
ylabel('Amplitude');
xlabel('Time (s)');
 %end
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(handles.checkbox1, 'Value');
 %if ~value
vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');

handles.ejex=0:1/8000:1;
axes(handles.axes2)
set(handles.text12,'string',vc);
set(handles.text14,'string',fc);
% axes(handles.axes1)
v_c=vc*cos(2*pi*fc*handles.ejex); %Carrier Signal Waveform

plot(handles.ejex,v_c,'-','Color',[0 1 0]);
%y_c=cos(2*pi*100*handles.ejex);
% title('CARRIER SIGNAL');
ylabel('Amplitude');
xlabel('Time (s)'); %Display Carrier Signal
 %end
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in timedomain.
function timedomain_Callback(hObject, eventdata, handles)
% hObject    handle to timedomain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.checkbox1, 'Value');
fs=8000;
  handles.ejex=0:1/fs:1;
 vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');
v_c=cos(2*pi*fc*handles.ejex);
choose=handles.type;
 if ~value
  fs=8000;
  handles.ejex=0:1/fs:1;
vm=get(handles.slider1,'value');
fm=get(handles.slider2,'value');
v_m=cos(2*pi*fm*handles.ejex);

 else
  vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');
v_c=cos(2*pi*fc*handles.ejex);
    v_m=handles.y;
   fs=handles.Fs;
    dt=1/fs;
   t=0:dt:(length(v_m)*dt)-dt;
    %v_am=ammod(v_m,fc,fs);
    v_am=modulate(y,fc,fs);
     axes(handles.axes3)
    plot(t,v_am);
%     %plot(t,y,'-','color',[0 1 0]), grid on;
 

 end
% axes(handles.axes3)
% if choose==1
%       m_am=handles.m;
%      v_am=vc*(1+m_am*v_m ).* v_c; %  AM Signal Gener
%     plot(handles.ejex,v_am);
%     title('AM Envelope');
% elseif choose==2
%      B=handles.b;
%      v_fm = vc*sin(2*pi*fc*handles.ejex+B.*cos(2*pi*fm*handles.ejex));
%     plot(handles.ejex,v_fm);
%     title('FM Envelope');
% elseif choose==3
%     v_dsb=v_m.*v_c;
%      plot(handles.ejex,v_dsb);
%      title('DSB Envelope');
% 
% end
   ylabel('Amplitude'); % Time Domain Representation Of AM Signal 
  xlabel('Time (s)');
 
% --- Executes on button press in spectrum.
function spectrum_Callback(hObject, eventdata, handles)
% hObject    handle to spectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.checkbox1, 'Value');
 if ~value
choose=handles.type;
handles.ejex=0:1/1000:1;
fs=8000;
Ts=1/8000;
N=256;

vm=get(handles.slider1,'value');
fm=get(handles.slider2,'value');
v_m=vm*cos(2*pi*fm*handles.ejex);

vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');
v_c=vc*cos(2*pi*fc*handles.ejex);


axes(handles.axes4)
if choose==1
     m_am=handles.m;
    v_am=vc*(1+m_am*cos(2*pi*fm*handles.ejex) ).*cos(2*pi*fc*handles.ejex); %  AM Signal Gener
    w=v_am;
elseif choose==2
      B=handles.b;
      v_fm = vc*sin(2*pi*fc*handles.ejex+B.*cos(2*pi*fm*handles.ejex));
       w=v_fm;
elseif choose==3
    v_dsb=v_m.*v_c;
     w=v_dsb;

end
y = fft(w(1:N)); % y contains 256 complex amplitudes
m = abs(y);
ff=(-N/2:N/2-1)/(Ts*N);
fws=fftshift(m);
axes(handles.axes4)
plot(ff,fws);
title('Spectrum of AM signal'); % Freqency Domain Representation of AM Signal
xlabel('Frequency')
ylabel('Magnitude');
 end



% --- Executes on button press in demodulate.
function demodulate_Callback(hObject, eventdata, handles)
% hObject    handle to demodulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.checkbox1, 'Value');
 if ~value
choose=handles.type;
fs=8000; % Specify Sampling Freqency
handles.ejex=0:1/1000:1;

vm=get(handles.slider1,'value');
fm=get(handles.slider2,'value');
v_m=vm*cos(2*pi*fm*handles.ejex);

vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');
v_c=vc*cos(2*pi*fc*handles.ejex);

% filt_ord = 5 ;         % filter order
% fc_filt=500;
% Fs_filt=1000;
% fcut = fc_filt /2; 
% s=v_am;
% % absolute value of the modulated signal
% s_abs = abs(s); 
% 
% % filtering with butterworth
% [b, a] = butter(filt_ord, 2*fcut / Fs_filt, 'low'); 
% %freqz(b,a,fcut,fs),title('frequency responce of the LPF');
% % s_filt = filter(b, a, s_abs);
% s_filt = filtfilt(b, a, s_abs);
% % remove the means
% s_rmvmn = (s_filt - mean(s_filt));
% %biasing the signal aroung -1 and 1 V
% s_demod = s_rmvmn / max(abs(s_rmvmn))

axes(handles.axes5)
if choose==1
    m_am=handles.m;
    v_am=vc*(1+m_am*cos(2*pi*fm*handles.ejex) ).*cos(2*pi*fc*handles.ejex); %  AM Signal Gener
    y=v_am;
    am_out=y.*cos(2*pi*fc*handles.ejex);
    [b,a] = butter(5,fc*2/fs);
    am_out = filtfilt(b,a,am_out);
    plot(handles.ejex,am_out);
elseif choose==2
    B=handles.b;
    v_fm = vc*sin(2*pi*fc*handles.ejex+B.*cos(2*pi*fm*handles.ejex));%fm modulated signal
    fm_out = demod(v_fm,fc,fs,'fm',B); % De-Modulated Signal
    [b,a] = butter(5,fc*2/fs);
    fm_out = filtfilt(b,a,fm_out);
    plot(handles.ejex,fm_out);
elseif choose==3
     v_dsb=v_m.*v_c;
    % dsb_out=demod(v_dsb,fc,fs,'amdsb-tc');%%%%%it doesn't work??????!!!!!
    dsb_out=v_dsb.*cos(2*pi*fc*handles.ejex);
    [b,a] = butter(5,fc*2/fs);
    dsb_out = filtfilt(b,a,dsb_out);
     plot(handles.ejex,dsb_out);

end
   ylabel('Amplitude'); % Time Domain Representation Of AM Signal 
  xlabel('Time (s)');
 end
 % Dispaly AM Demodulator Output

% --- Executes on button press in spectrumsig.
function spectrumsig_Callback(hObject, eventdata, handles)
% hObject    handle to spectrumsig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(handles.checkbox1, 'Value');
 if ~value
     fs=8000;
vm=get(handles.slider1,'value');
fm=get(handles.slider2,'value');
handles.ejex=0:1/1000:1;
v_m=vm*cos(2*pi*fm*handles.ejex);
w=v_m;
Ts=1/fs;
N=256;
y = fft(w(1:N)); % y contains 256 complex amplitudes
m = abs(y); % m = magnitude of sinusoids
% plot spectrum 0....fs/2
ff=(-N/2:N/2-1)/(Ts*N);
fws=fftshift(m);
axes(handles.axes6)
plot(ff,fws,'-','color',[0 1 0]);
 else
   w=handles.y;
  fs=handles.Fs;
   z=fft(w);       %fourier transforme
  f=(0:length(w)-1)*fs/length(w);
  axes(handles.axes6)
  plot(f,abs(z),'-','color',[0 1 0]);grid on;
 end   
xlabel('Frequency')
ylabel('Magnitude');
title('Spectrum of modulating signal'); % Freqency Domain Representation of AM Signal

 
% --- Executes on selection change in choose_teqnique.
function choose_teqnique_Callback(hObject, eventdata, handles)
% hObject    handle to choose_teqnique (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choose_teqnique contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choose_teqnique
%value = get(handles.checkbox1, 'Value');
 %if ~value
handles = guidata(hObject);  % Not sure if handles is up to date already
switch get(handles.choose_teqnique, 'value')
case 1
  type=1;  % Cheaper than the power operation
case 2
  type =2;
case 3
  type =3;
    
end
handles.type = type;
guidata(hObject, handles);  % Write back updates of "handles" struct
 %end

% --- Executes during object creation, after setting all properties.
function choose_teqnique_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choose_teqnique (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in modindex.
function modindex_Callback(hObject, eventdata, handles)
% hObject    handle to modindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns modindex contents as cell array
%        contents{get(hObject,'Value')} returns selected item from modindex
%value = get(handles.checkbox1, 'Value');
 %if ~value
 handles = guidata(hObject); 
switch get(handles.modindex, 'value')
case 1
  m=0.3;  % Cheaper than the power operation
case 2
  m =0.5;
case 3
  m =1;
otherwise
    m=1.5;
end
handles.m = m;
guidata(hObject, handles);  % Write back updates of "handles" struct
 %end

% --- Executes during object creation, after setting all properties.
function modindex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to modindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sensitivity_factor.
function sensitivity_factor_Callback(hObject, eventdata, handles)%fm modulation
% hObject    handle to sensitivity_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sensitivity_factor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sensitivity_factor
%value = get(handles.checkbox1, 'Value');
 %if ~value
handles = guidata(hObject);  % Not sure if handles is up to date already
switch get(handles.sensitivity_factor, 'value')
case 1
  b=0.1;  % Cheaper than the power operation
case 2
  b=0.3;
case 3
  b =5;
otherwise
    b=10;
end
handles.b = b;
guidata(hObject, handles);  % Write back updates of "handles" struct
 %end

% --- Executes during object creation, after setting all properties.
function sensitivity_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensitivity_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in no_of_bits.
function no_of_bits_Callback(hObject, eventdata, handles)
% hObject    handle to no_of_bits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns no_of_bits contents as cell array
%        contents{get(hObject,'Value')} returns selected item from no_of_bits
handles = guidata(hObject);  % Not sure if handles is up to date already
switch get(handles.no_of_bits, 'value')
case 1
  n=2;  % Cheaper than the power operation
case 2
  n=3;
case 3
  n =4;
otherwise
    n=5;
end
handles.n = n;
guidata(hObject, handles);  % Write back updates of "handles" struct


% --- Executes during object creation, after setting all properties.
function no_of_bits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to no_of_bits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject); 
value = get(handles.checkbox1, 'Value');
 if value
load handel.mat
audiowrite('record1.wav', y ,Fs);
[y,Fs] = audioread('record1.wav');
dt=1/Fs;
  t=0:dt:(length(y)*dt)-dt;
  axes(handles.axes1)
  plot(t,y,'-','color',[0 1 0]), grid on;
   sound(y,Fs);
handles.y=y;
handles.Fs=Fs;
guidata(hObject, handles); 




 end
