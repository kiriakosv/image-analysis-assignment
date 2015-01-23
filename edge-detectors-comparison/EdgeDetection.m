function varargout = EdgeDetection(varargin)
% EDGEDETECTION MATLAB code for EdgeDetection.fig
%      EDGEDETECTION, by itself, creates a new EDGEDETECTION or raises the existing
%      singleton*.
%
%      H = EDGEDETECTION returns the handle to a new EDGEDETECTION or the handle to
%      the existing singleton*.
%
%      EDGEDETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGEDETECTION.M with the given input arguments.
%
%      EDGEDETECTION('Property','Value',...) creates a new EDGEDETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EdgeDetection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EdgeDetection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EdgeDetection

% Last Modified by GUIDE v2.5 28-Dec-2014 13:49:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EdgeDetection_OpeningFcn, ...
                   'gui_OutputFcn',  @EdgeDetection_OutputFcn, ...
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


% --- Executes just before EdgeDetection is made visible.
function EdgeDetection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EdgeDetection (see VARARGIN)

% Make axis invisible until an image is loaded.
set(handles.axes1,'visible','off');
set(handles.axes2,'visible','off');
set(handles.axes3,'visible','off');
set(handles.axes4,'visible','off');
set(handles.axes5,'visible','off');

% Disable run button until an image is loaded
set(handles.run,'Enable','off');

% Choose default command line output for EdgeDetection
handles.output = hObject;

% Add handle for file
handles.filename = [];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EdgeDetection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EdgeDetection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_image.
function load_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
cla(handles.axes2);
cla(handles.axes3);
cla(handles.axes4);
cla(handles.axes5);
handles.filename = [];
set(handles.run,'Enable','off');
guidata(hObject, handles);
filename = uigetfile('*.tif; *.png; *.jpg');
if not(isequal(filename,0))
   filename = imread(filename);
   try
       filename = rgb2gray(filename);
   catch
   end
   handles.filename = filename;
   guidata(hObject, handles);
   axes(handles.axes5);
   imshow(handles.filename);
   set(handles.run,'Enable','on');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
bw = edge(handles.filename, 'roberts');
imshow(bw);
axes(handles.axes2);
bw = edge(handles.filename, 'prewitt');
imshow(bw);
axes(handles.axes4);
bw = edge(handles.filename, 'sobel');
imshow(bw);
axes(handles.axes3);
bw = kirsch(handles.filename);
imshow(bw);
