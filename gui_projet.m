function varargout = guidetemplate0(varargin)
% GUIDETEMPLATE0 MATLAB code for guidetemplate0.fig
%      GUIDETEMPLATE0, by itself, creates a new GUIDETEMPLATE0 or raises the existing
%      singleton*.
%
%      H = GUIDETEMPLATE0 returns the handle to a new GUIDETEMPLATE0 or the handle to
%      the existing singleton*.
%
%      GUIDETEMPLATE0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDETEMPLATE0.M with the given input arguments.
%
%      GUIDETEMPLATE0('Property','Value',...) creates a new GUIDETEMPLATE0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guidetemplate0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guidetemplate0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2014 The MathWorks, Inc.

% Edit the above text to modify the response to help guidetemplate0

% Last Modified by GUIDE v2.5 24-Feb-2021 15:37:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guidetemplate0_OpeningFcn, ...
                   'gui_OutputFcn',  @guidetemplate0_OutputFcn, ...
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


% --- Executes just before guidetemplate0 is made visible.
function guidetemplate0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guidetemplate0 (see VARARGIN)

% Choose default command line output for guidetemplate0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guidetemplate0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guidetemplate0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function New_Callback(hObject, eventdata, handles)
% hObject    handle to New (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function webcam_Callback(hObject, eventdata, handles)
% hObject    handle to webcam_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
cam1=webcam;
img=snapshot(cam1);
axes(handles.axes1);
imshow(img);
axes(handles.axes4);
imhist(img);

% --------------------------------------------------------------------
function ipcam_Callback(hObject, eventdata, handles)
% hObject    handle to ipcam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img;
prompt = {'Enter your camera IP,exemple (http://192.168.1.110:8080/video)'};
dlg_title = 'IP';
num_lines = 1;
ip = inputdlg(prompt,dlg_title,num_lines);
a=ip{:};
cam1=ipcam(a);
img=snapshot(cam1);
axes(handles.axes1);
imshow(img);
%pour histogramme
axes(handles.axes4);
imhist(img);

% --------------------------------------------------------------------
function SelectFromPc_Callback(hObject, eventdata, handles)
% hObject    handle to SelectFromPc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global img;
 axes(handles.axes1);
 [path,x]=imgetfile();
 img=imread(path);
 imshow(img);
 axes(handles.axes4);
 imhist(img);

% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Quit_Callback(hObject, eventdata, handles)
% hObject    handle to Quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --------------------------------------------------------------------
function Video_file_Callback(hObject, eventdata, handles)
% hObject    handle to Video_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function WebCam_video_Callback(hObject, eventdata, handles)
% hObject    handle to WebCam_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cam= webcam;
t=20;
fps=30;
nof=t*fps;
vidWriter = VideoWriter('vid1.mp4');
open(vidWriter);
for index = 1:nof
    img = snapshot(cam);
    preview(cam);
    writeVideo(vidWriter, img);
    pause(t/nof);
end  
close(vidWriter);
clear cam;

% --------------------------------------------------------------------
function IPcam_video_Callback(hObject, eventdata, handles)
% hObject    handle to IPcam_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter your camera IP,example (http://192.168.1.110:8080/video)'};
dlg_title = 'IP';
num_lines = 1;
ip = inputdlg(prompt,dlg_title,num_lines);
a=ip{:};
cam= ipcam(a);
%cam= ipcam('http://192.168.1.100:8080/video');
t=20;
fps=30;
nof=t*fps;
vidWriter = VideoWriter('vid2.mp4');
open(vidWriter);
for index = 1:nof
    img = snapshot(cam);
    preview(cam);
    writeVideo(vidWriter, img);
    pause(t/nof);
end 
close(vidWriter);
clear cam;

% --------------------------------------------------------------------
function Noises_Callback(hObject, eventdata, handles)
% hObject    handle to Noises (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function salt_pepper_Callback(hObject, eventdata, handles)
% hObject    handle to salt_pepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter the noise density:'};
dlg_title = 'salt and pepper noise';
num_lines = 1;
bruit = inputdlg(prompt,dlg_title,num_lines);
a=str2num(bruit{:});
res = imnoise(img,'salt & pepper',a);
axes(handles.axes2);
imshow(res);
axes(handles.axes3);
imhist(res);


% --------------------------------------------------------------------
function gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%gaussian noise
global img;
prompt = {'Enter a Gaussian variance:'};
dlg_title = 'Gaussian noise';
num_lines = 1;
gauss = inputdlg(prompt,dlg_title,num_lines);
v=str2num(gauss{:});
res = imnoise(img,'gaussian',0,v);
axes(handles.axes2);
imshow(res);
axes(handles.axes3);
imhist(res);


% --------------------------------------------------------------------
function Basic_Modification_Callback(hObject, eventdata, handles)
% hObject    handle to Basic_Modification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter angle of rotation:'};
dlg_title = 'Rotation';
num_lines = 1;
angle = inputdlg(prompt,dlg_title,num_lines);
a=str2num(angle{:});
res = imrotate(img,a);
axes(handles.axes2)
imshow(res);
axes(handles.axes3)
imhist(res);

% --------------------------------------------------------------------
function Mirror_Callback(hObject, eventdata, handles)
% hObject    handle to Mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function negative_Callback(hObject, eventdata, handles)
% hObject    handle to negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res = 255 - img;
axes(handles.axes2);
imshow(res); 
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Transformation_LUT_Callback(hObject, eventdata, handles)
% hObject    handle to Transformation_LUT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function with_saturation_Callback(hObject, eventdata, handles)
% hObject    handle to with_saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
mi = 80;
ma = 150;
res=(img-mi).*(255./(ma-img));
axes(handles.axes2);
imshow(res);
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function without_saturation_Callback(hObject, eventdata, handles)
% hObject    handle to without_saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
ma = max(max(img));
mi = min(min(img));
res=(img-mi).*(255./(ma-mi));
axes(handles.axes2);
imshow(res);
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Histogram_equalization_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram_equalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
res = histeq(img); 
axes(handles.axes2);
imshow(res);
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Filtering_images_Callback(hObject, eventdata, handles)
% hObject    handle to Filtering_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Moyen_filtre_Callback(hObject, eventdata, handles)
% hObject    handle to Moyen_filtre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter the degree of Gaussian noise:'};
dlg_title = 'Noise';
num_lines = 1;
bruit = inputdlg(prompt,dlg_title,num_lines);
b=str2num(bruit{:});
m = imnoise(img, 'gaussian', 0,b);
axes(handles.axes2);
imshow(m);
prompt = {'Enter the degree of filter:'};
dlg_title = 'Filter';
num_lines = 1;
filtre = inputdlg(prompt,dlg_title,num_lines);
a=str2num(filtre{:});
img= ones(a) / (a*a);
res = imfilter(m,img);
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Gaussian_filtre_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_filtre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter a Gaussian variance:'};
dlg_title = 'Gaussian';
num_lines = 1;
gauss = inputdlg(prompt,dlg_title,num_lines);
v=str2num(gauss{:});
res = imgaussfilt(img,v);
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Median_filtre_Callback(hObject, eventdata, handles)
% hObject    handle to Median_filtre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter the degree of impulse noise:'};
dlg_title = 'Noise';
num_lines = 1;
bruit = inputdlg(prompt,dlg_title,num_lines);
b=str2num(bruit{:});
gray=rgb2gray(img);
m = imnoise(gray, 'salt & pepper',0.02);
res = medfilt2(m);
axes(handles.axes2)
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);


% --------------------------------------------------------------------
function Original_Image_save_Callback(hObject, eventdata, handles)
% hObject    handle to Original_Image_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.axes1);
imsave;

% --------------------------------------------------------------------
function Modified_Image_save_Callback(hObject, eventdata, handles)
% hObject    handle to Modified_Image_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
axes(handles.axes2);
imsave;


% --------------------------------------------------------------------
function horizontal_mirror_Callback(hObject, eventdata, handles)
% hObject    handle to horizontal_mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=img(:,end:-1:1,:);
axes(handles.axes2);
imshow(res);
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function vertical_mirror_Callback(hObject, eventdata, handles)
% hObject    handle to vertical_mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=img(end:-1:1,:,:);
axes(handles.axes2);
imshow(res);
axes(handles.axes3);
imhist(res);


% --------------------------------------------------------------------
function Sinusoidal_Callback(hObject, eventdata, handles)
% hObject    handle to Sinusoidal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global img;
%[x y] = meshgrid(1:256,1:256);
%mysinusoidalnoise = 15 * sin(2*pi/14*x+2*pi/14*y);
%gr=rgb2gray(img);
%res = double(gr) + mysinusoidalnoise;
%axes(handles.axes2);
%imshow(res,[]);

% --------------------------------------------------------------------
function Contour_Callback(hObject, eventdata, handles)
% hObject    handle to Contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sobel_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=rgb2gray(img);
res = edge(res,'sobel');
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Prewitt_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=rgb2gray(img);
res = edge(res,'prewitt');
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Canny_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Canny_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=rgb2gray(img);
res = edge(res,'canny');
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Roberts_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=rgb2gray(img);
res = edge(res,'roberts');
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Morphologies_Callback(hObject, eventdata, handles)
% hObject    handle to Morphologies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Dilatation_morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Dilatation_morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter the first dilatation parameter:'};
dlg_title = 'Dilatation';
num_lines = 1;
dilaltation = inputdlg(prompt,dlg_title,num_lines);
a=str2num(dilaltation{:});

prompt = {'Enter the second dilatation parameter:'};
dlg_title = 'Dilatation';
num_lines = 1;
dilaltation = inputdlg(prompt,dlg_title,num_lines);
b=str2num(dilaltation{:});

se = strel('line',a,b);
res = imdilate(img, se);
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);


% --------------------------------------------------------------------
function Erosion_morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Erosion_morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter the first erosion morphology parameter:'};
dlg_title = 'Eurosion';
num_lines = 1;
dilaltation = inputdlg(prompt,dlg_title,num_lines);
a=str2num(dilaltation{:});

prompt = {'Enter the second erosion morphology parameter:'};
dlg_title = 'Eurosion';
num_lines = 1;
dilaltation = inputdlg(prompt,dlg_title,num_lines);
b=str2num(dilaltation{:});

se = strel('line',a,b);
res = imerode(img,se);
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Opening_morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Opening_morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=im2bw(img);
SE=[0 1 0;1 1 1;0 1 0];
res=imopen(res,SE);
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Closing_morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Closing_morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=im2bw(img);

prompt = {'Enter the closing value:'};
dlg_title = 'Closing';
num_lines = 1;
fermeture = inputdlg(prompt,dlg_title,num_lines);
f=str2num(fermeture{:});

SE=strel('disk',f);
res=imclose(res,SE);
axes(handles.axes2);
imshow(res);
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Fourier_transform_Callback(hObject, eventdata, handles)
% hObject    handle to Fourier_transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Amplitude_spectre_Callback(hObject, eventdata, handles)
% hObject    handle to Amplitude_spectre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=rgb2gray(img);
FS=fft2(double(res)); 
module=abs(fftshift(FS)); 
Max=max(max(max(abs(module))));
res=(module *255 /Max);
axes(handles.axes2);
imshow(res); 
%histogram
axes(handles.axes3);
imhist(res);

% --------------------------------------------------------------------
function Spectre_de_phase_Callback(hObject, eventdata, handles)
% hObject    handle to Spectre_de_phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
res=rgb2gray(img);
FS=fft2(double(res)); 
phase=angle(fftshift(FS)); 
axes(handles.axes2);
imshow(phase,[-pi,pi]);
axes(handles.axes3);
imhist(phase);


% --------------------------------------------------------------------
function changer_luminosite_Callback(hObject, eventdata, handles)
% hObject    handle to changer_luminosite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
prompt = {'Enter the degree of brightness:(0<luminosite<256)'};
dlg_title = 'Brightness';
num_lines = 1;
luminosite = inputdlg(prompt,dlg_title,num_lines);
lu=str2num(luminosite{:});
res=img+lu;
axes(handles.axes2);
imshow (res);
axes(handles.axes3);
imhist(res);
