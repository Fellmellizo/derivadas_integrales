function varargout = der_int(varargin)
% DER_INT MATLAB code for der_int.fig
%      DER_INT, by itself, creates a new DER_INT or raises the existing
%      singleton*.
%
%      H = DER_INT returns the handle to a new DER_INT or the handle to
%      the existing singleton*.
%
%      DER_INT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DER_INT.M with the given input arguments.
%
%      DER_INT('Property','Value',...) creates a new DER_INT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before der_int_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to der_int_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help der_int

% Last Modified by GUIDE v2.5 16-Dec-2015 00:45:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @der_int_OpeningFcn, ...
                   'gui_OutputFcn',  @der_int_OutputFcn, ...
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


% --- Executes just before der_int is made visible.
function der_int_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to der_int (see VARARGIN)

% Choose default command line output for der_int
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes der_int wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = der_int_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
f=get(handles.funcion,'String');
t = get(handles.tiendea,'String');
syms x;
der=diff(f,x);
integ=int(f,x);

LIMITE_FUNCION_IZ = limit(f,x,t,'left');
LIMITE_FUNCION_DER= limit(f,x,t,'right');


set(handles.Res_Derivada, 'String', char(der));
set(handles.Res_Integral, 'String', char(integ));
set(handles.Res_limite, 'String', char (LIMITE_FUNCION_IZ));
set(handles.Res_limite_der, 'String', char (LIMITE_FUNCION_DER));




% --- Executes on button press in borrar.
function borrar_Callback(hObject, ~, handles)
set(handles.funcion, 'String', '');

set(handles.Res_Derivada, 'String', '');

set(handles.Res_Integral, 'String', '');

set(handles.Res_limite, 'String', '');

set (handles.tiendea, 'string', '');
set (handles.Res_limite_der, 'string', '');
% hObject    handle to borrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Res_Derivada_Callback(hObject, eventdata, handles)
% hObject    handle to Res_Derivada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res_Derivada as text
%        str2double(get(hObject,'String')) returns contents of Res_Derivada as a double


% --- Executes during object creation, after setting all properties.
function Res_Derivada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res_Derivada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Res_Integral_Callback(hObject, eventdata, handles)
% hObject    handle to Res_Integral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res_Integral as text
%        str2double(get(hObject,'String')) returns contents of Res_Integral as a double


% --- Executes during object creation, after setting all properties.
function Res_Integral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res_Integral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function funcion_Callback(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcion as text
%        str2double(get(hObject,'String')) returns contents of funcion as a double


% --- Executes during object creation, after setting all properties.
function funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function archivo_Callback(hObject, eventdata, handles)
% hObject    handle to archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in graficar.
function graficar_Callback(hObject, eventdata, handles)
y=get(handles.Res_Derivada, 'String');
plot(x,y);
set(handles.grafica, 'String',y);




% --------------------------------------------------------------------
function editar_Callback(hObject, eventdata, handles)
% hObject    handle to editar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Res_limite_Callback(hObject, eventdata, handles)
% hObject    handle to Res_limite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res_limite as text
%        str2double(get(hObject,'String')) returns contents of Res_limite as a double


% --- Executes during object creation, after setting all properties.
function Res_limite_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res_limite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tiendea_Callback(hObject, eventdata, handles)
% hObject    handle to tiendea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiendea as text
%        str2double(get(hObject,'String')) returns contents of tiendea as a double


% --- Executes during object creation, after setting all properties.
function tiendea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiendea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Res_limite_der_Callback(hObject, eventdata, handles)
% hObject    handle to Res_limite_der (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res_limite_der as text
%        str2double(get(hObject,'String')) returns contents of Res_limite_der as a double


% --- Executes during object creation, after setting all properties.
function Res_limite_der_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res_limite_der (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Res_lim_cero_Callback(hObject, eventdata, handles)
% hObject    handle to Res_lim_cero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res_lim_cero as text
%        str2double(get(hObject,'String')) returns contents of Res_lim_cero as a double


% --- Executes during object creation, after setting all properties.
function Res_lim_cero_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res_lim_cero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
