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

% Last Modified by GUIDE v2.5 13-Mar-2021 01:46:03

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
global img;
global res;
cam1=webcam;
img=snapshot(cam1);
res=img;
axes(handles.axes1);
imshow(img);

% --------------------------------------------------------------------
function ipcam_Callback(hObject, eventdata, handles)
% hObject    handle to ipcam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img;
global res;
prompt = {'Enter your camera IP,exemple (http://192.168.1.110:8080/video)'};
dlg_title = 'IP';
num_lines = 1;
ip = inputdlg(prompt,dlg_title,num_lines);
a=ip{:};
cam1=ipcam(a);
img=snapshot(cam1);
res=img;
axes(handles.axes1);
imshow(img);

% --------------------------------------------------------------------
function SelectFromPc_Callback(hObject, eventdata, handles)
% hObject    handle to SelectFromPc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global img;
 global res;
 axes(handles.axes1);
 [path,x]=imgetfile();
 img=imread(path);
 res=img;
 imshow(img);

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
t=10;
fps=30;
nof=t*fps;
prompt = {'Name the video :'};
dlg_title = 'nom';
num_lines = 1;
nom = inputdlg(prompt,dlg_title,num_lines);
n=nom{:};

vidWriter = VideoWriter(n);
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
t=10;
fps=30;
nof=t*fps;
prompt = {'Name the video :'};
dlg_title = 'nom';
num_lines = 1;
nom = inputdlg(prompt,dlg_title,num_lines);
n=nom{:};

vidWriter = VideoWriter(n);
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
global res;
prompt = {'Enter the noise density:'};
dlg_title = 'salt and pepper noise';
num_lines = 1;
bruit = inputdlg(prompt,dlg_title,num_lines);
a=str2num(bruit{:});
res = imnoise(res,'salt & pepper',a);
axes(handles.axes1);
imshow(res);


% --------------------------------------------------------------------
function gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%gaussian noise
global res;
prompt = {'Enter a Gaussian variance:'};
dlg_title = 'Gaussian noise';
num_lines = 1;
gauss = inputdlg(prompt,dlg_title,num_lines);
v=str2num(gauss{:});
res = imnoise(res,'gaussian',0,v);
axes(handles.axes1);
imshow(res);


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
global res;
prompt = {'Enter angle of rotation:'};
dlg_title = 'Rotation';
num_lines = 1;
angle = inputdlg(prompt,dlg_title,num_lines);
a=str2num(angle{:});
res = imrotate(res,a);
axes(handles.axes1)
imshow(res);

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
global res;
res = 255 - res;
axes(handles.axes1);
imshow(res); 

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
global res;
prompt = {'Minimum:'};
dlg_title = 'minimum';
num_lines = 1;
minimum = inputdlg(prompt,dlg_title,num_lines);
mi=str2num(minimum{:});

prompt = {'Maximum:'};
dlg_title = 'maximum';
num_lines = 1;
maximum = inputdlg(prompt,dlg_title,num_lines);
ma=str2num(maximum{:});
res=(res-mi).*(255./(ma-res));
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function without_saturation_Callback(hObject, eventdata, handles)
% hObject    handle to without_saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
ma = max(max(res));
mi = min(min(res));
res=(res-mi).*(255./(ma-mi));
axes(handles.axes1);
imshow(res);


% --------------------------------------------------------------------
function Histogram_equalization_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram_equalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res = histeq(res); 
axes(handles.axes1);
imshow(res);

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
global res;
prompt = {'Enter the degree of filter:'};
dlg_title = 'Filter';
num_lines = 1;
filtre = inputdlg(prompt,dlg_title,num_lines);
a=str2num(filtre{:});
im= ones(a) / (a*a);
res = imfilter(res,im);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Gaussian_filtre_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_filtre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
prompt = {'Enter a Gaussian variance:'};
dlg_title = 'Gaussian';
num_lines = 1;
gauss = inputdlg(prompt,dlg_title,num_lines);
v=str2num(gauss{:});
res = imgaussfilt(res,v);
axes(handles.axes1);
imshow(res);


% --------------------------------------------------------------------
function Median_filtre_Callback(hObject, eventdata, handles)
% hObject    handle to Median_filtre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res = medfilt2(res);
axes(handles.axes1);
imshow(res);


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
axes(handles.axes1);
imsave;


% --------------------------------------------------------------------
function horizontal_mirror_Callback(hObject, eventdata, handles)
% hObject    handle to horizontal_mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=res(:,end:-1:1,:);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function vertical_mirror_Callback(hObject, eventdata, handles)
% hObject    handle to vertical_mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=res(end:-1:1,:,:);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Sinusoidal_Callback(hObject, eventdata, handles)
% hObject    handle to Sinusoidal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global img;
%global res;
%[x y] = meshgrid(1:256,1:256);
%mysinusoidalnoise = 15 * sin(2*pi/14*x+2*pi/14*y);
%gr=rgb2gray(img);
%res = double(gr) + mysinusoidalnoise;
%axes(handles.axes1);
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
global res;
res=rgb2gray(res);
res = edge(res,'sobel');
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Prewitt_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=rgb2gray(res);
res = edge(res,'prewitt');
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Canny_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Canny_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=rgb2gray(res);
res = edge(res,'canny');
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Roberts_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=rgb2gray(res);
res = edge(res,'roberts');
axes(handles.axes1);
imshow(res);

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
global res;
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
res = imdilate(res, se);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Erosion_morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Erosion_morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Opening_morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Opening_morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=im2bw(res);
SE=[0 1 0;1 1 1;0 1 0];
res=imopen(res,SE);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Closing_morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Closing_morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=im2bw(res);

prompt = {'Enter the closing value:'};
dlg_title = 'Closing';
num_lines = 1;
fermeture = inputdlg(prompt,dlg_title,num_lines);
f=str2num(fermeture{:});

SE=strel('disk',f);
res=imclose(res,SE);
axes(handles.axes1);
imshow(res);

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
global res;
%res=rgb2gray(res);
FS=fft2(double(res)); 
module=abs(fftshift(FS)); 
Max=max(max(max(abs(module))));
res=(module *255 /Max);
axes(handles.axes1);
imshow(res); 

% --------------------------------------------------------------------
function Spectre_de_phase_Callback(hObject, eventdata, handles)
% hObject    handle to Spectre_de_phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
%res=rgb2gray(res);
FS=fft2(double(res)); 
res=angle(fftshift(FS)); 
axes(handles.axes1);
imshow(res,[-pi,pi]);

% --------------------------------------------------------------------
function changer_luminosite_Callback(hObject, eventdata, handles)
% hObject    handle to changer_luminosite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
prompt = {'Enter the degree of brightness:(0<luminosite<256)'};
dlg_title = 'Brightness';
num_lines = 1;
luminosite = inputdlg(prompt,dlg_title,num_lines);
lu=str2num(luminosite{:});
res=res+lu;
axes(handles.axes1);
imshow (res);

% --------------------------------------------------------------------
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Original_Image_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Original_Image_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
figure;
imhist(img);
title('Original image histogram');

% --------------------------------------------------------------------
function Modified_Image_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Modified_Image_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
figure;
imhist(res);
title('Modified image histogram');


% --------------------------------------------------------------------
function Image_Eurosion_Callback(hObject, eventdata, handles)
% hObject    handle to Image_Eurosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=im2bw(res);
%img=[
%0   0   0   1   0   0   0
%0   1   1   1   1   1   0
%0   1   0   1   1   1   0
%1   1   1   1   1   1   0
%0   0   1   1   1   1   0
%0   1   1   1   1   1   0
%0   0   0   0   0   1   0];
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Cube_eurosion_Callback(hObject, eventdata, handles)
% hObject    handle to Cube_eurosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global img;
global res;
st1=[1 1 1 
     1 1 1
     1 1 1];
res= imerode(res,st1);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Cercle_eurosion_Callback(hObject, eventdata, handles)
% hObject    handle to Cercle_eurosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global img;
global res;
st2=[0 1 0 
     1 1 1
     0 1 0];
res= imerode(res,st2);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Horizontal_eurosion_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal_eurosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global img;
global res;
st3=[0 1 0 
     0 1 0
     0 1 0]; 
res= imerode(res,st3);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Vertical_eurosion_Callback(hObject, eventdata, handles)
% hObject    handle to Vertical_eurosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global img;
global res;
st4=[0 0 0 
     1 1 1
     0 0 0]; 
res= imerode(res,st4);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Amplitude_A_avec_phase_B_Callback(hObject, eventdata, handles)
% hObject    handle to Amplitude_A_avec_phase_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
global imageB;
imageB = imread('peppers.png');
res=imresize(res,[size(imageB,1) size(imageB,2)]);
fftA = fft2(double(res));
fftB = fft2(double(imageB));
fftC = abs(fftA).*exp(1i*angle(fftB));
imageC = ifft2(fftC);
cmin = min(min(min(abs(imageC))));
cmax = max(max(max(abs(imageC))));
axes(handles.axes1);
res=imshow(abs(imageC/255), [cmin cmax]);

% --------------------------------------------------------------------
function reconstruite_Callback(hObject, eventdata, handles)
% hObject    handle to reconstruite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
global imageB;
res=imresize(res,[size(imageB,1) size(imageB,2)]);
fftA = fft2(double(res));
fftB = fft2(double(imageB));
fftE= abs(fftA).*exp(1i*angle(fftA));
fftC = abs(fftA).*exp(1i*angle(fftB));
imageC = ifft2(fftC);
imageE = ifft2(fftE);
cmin = min(min(min(abs(imageC))));
cmax = max(max(max(abs(imageC))));
axes(handles.axes1);
res=imshow(abs(imageE/255), [cmin cmax]);


% --------------------------------------------------------------------
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global res;
res=img;
axes(handles.axes1);
imshow(img);


% --------------------------------------------------------------------
function Gray_image_Callback(hObject, eventdata, handles)
% hObject    handle to Gray_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=rgb2gray(res);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function black_white_image_Callback(hObject, eventdata, handles)
% hObject    handle to black_white_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
res=im2bw(res);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function Video_Operations_Callback(hObject, eventdata, handles)
% hObject    handle to Video_Operations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Gray_video_Callback(hObject, eventdata, handles)
% hObject    handle to Gray_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter the video name (with avi extension):'};
dlg_title = 'nom';
num_lines = 1;
nom = inputdlg(prompt,dlg_title,num_lines);
n=nom{:};

obj=VideoReader(n);
nFrames=obj.NumberOfFrames;
vidHeight=obj.Height;
vidWidth=obj.Width;
mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);
for  k=1:nFrames
     mov(k).cdata=rgb2gray(read(obj,k));
end
implay(mov);

% --------------------------------------------------------------------
function Black_White_video_Callback(hObject, eventdata, handles)
% hObject    handle to Black_White_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Entrer the video name (with avi extension):'};
dlg_title = 'nom';
num_lines = 1;
nom = inputdlg(prompt,dlg_title,num_lines);
n=nom{:};

obj=VideoReader(n);
nFrames=obj.NumberOfFrames;
vidHeight=obj.Height;
vidWidth=obj.Width;
mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);
for  k=1:nFrames
     mov(k).cdata=im2bw(read(obj,k));
end
implay(mov);

% --------------------------------------------------------------------
function bruit_video_Callback(hObject, eventdata, handles)
% hObject    handle to bruit_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Rotate_video_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Entrer the video name (with avi extension):'};
dlg_title = 'nom';
num_lines = 1;
nom = inputdlg(prompt,dlg_title,num_lines);
n=nom{:};

prompt = {'Enter the degree of rotation :'};
dlg_title = 'rotation';
num_lines = 1;
rotation = inputdlg(prompt,dlg_title,num_lines);
r=str2num(rotation{:});

obj=VideoReader(n);
nFrames=obj.NumberOfFrames;
vidHeight=obj.Height;
vidWidth=obj.Width;
mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);
for  k=1:nFrames
     mov(k).cdata=imrotate(read(obj,k),r);
end
implay(mov);

% --------------------------------------------------------------------
function salt_pepper_video_Callback(hObject, eventdata, handles)
% hObject    handle to salt_pepper_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Entrer video name (with avi extension):'};
dlg_title = 'nom';
num_lines = 1;
nom = inputdlg(prompt,dlg_title,num_lines);
n=nom{:};

prompt = {'Enter the degree of impulse noise :[0-1]'};
dlg_title = 'bruit';
num_lines = 1;
bruit = inputdlg(prompt,dlg_title,num_lines);
bs=str2num(bruit{:});

obj=VideoReader(n);
nFrames=obj.NumberOfFrames;
vidHeight=obj.Height;
vidWidth=obj.Width;
mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);
for  k=1:nFrames
     mov(k).cdata=imnoise(read(obj,k),'salt & pepper',bs);
end
implay(mov);

% --------------------------------------------------------------------
function bruit_gaussian_video_Callback(hObject, eventdata, handles)
% hObject    handle to bruit_gaussian_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Entrer the video name (with the extension):'};
dlg_title = 'nom';
num_lines = 1;
nom = inputdlg(prompt,dlg_title,num_lines);
n=nom{:};

prompt = {'Enter the degree of Gaussian noise : [0-1]'};
dlg_title = 'bruit';
num_lines = 1;
bruit = inputdlg(prompt,dlg_title,num_lines); 
bg=str2num(bruit{:});

obj=VideoReader(n);
nFrames=obj.NumberOfFrames;
vidHeight=obj.Height;
vidWidth=obj.Width;
mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);
for  k=1:nFrames
     mov(k).cdata=imnoise(read(obj,k),'gaussian',0,bg);
end
implay(mov);


% --------------------------------------------------------------------
function Thresholding_Callback(hObject, eventdata, handles)
% hObject    handle to Thresholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function binary_image_Callback(hObject, eventdata, handles)
% hObject    handle to binary_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
prompt = {'Enter the threshold : [0-256]'};
dlg_title = 'Threshold';
num_lines = 1;
seuil = inputdlg(prompt,dlg_title,num_lines);
s=str2num(seuil{:});
res = im2bw(res,s/256);
axes(handles.axes1);
imshow(res);

% --------------------------------------------------------------------
function seuil_Otsu_Callback(hObject, eventdata, handles)
% hObject    handle to seuil_Otsu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
level = graythresh(res);
res = im2bw(res,level); 
axes(handles.axes1);
imshow(res);
