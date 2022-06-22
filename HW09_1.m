clc; close all; clear all;

img = imread('1.jpg');

if length(size(img))==3
    img = rgb2gray(img);
end
var = 0.05;
img_noise = imnoise(img,'salt & pepper', var);

figure(1),
subplot(1,2,1),imshow(img)
subplot(1,2,2),imshow(img_noise)

med_window1 = [3,3];
med_window2 = [9,9];

img_med1 = medfilt2(img_noise,med_window1);
img_med2 = medfilt2(img_noise,med_window2);

figure(2),
subplot(1,2,1),imshow(img_med1)
subplot(1,2,2),imshow(img_med2)

wn = 'sym4';
[CA_org, CV_org, CH_org, CD_org] = dwt2(img,wn);
[CA, CV, CH, CD] = dwt2(img_noise,wn);

ca_med1 = medfilt2(CA,med_window1);
cv_med1 = medfilt2(CV,med_window1);
ch_med1 = medfilt2(CH,med_window1);
cd_med1 = medfilt2(CD,med_window1);

ca_med2 = medfilt2(CA,med_window2);
cv_med2 = medfilt2(CV,med_window2);
ch_med2 = medfilt2(CH,med_window2);
cd_med2 = medfilt2(CD,med_window2);

figure(3),
subplot(2,2,1),imshow(CA_org),title('CA_org')
subplot(2,2,2),imshow(CA),title('CA')
subplot(2,2,3),imshow(ca_med1),title('CA medfilter 3*3')
subplot(2,2,4),imshow(ca_med2),title('CA medfilter 9*9')
figure(4),
subplot(2,2,1),imshow(CV_org),title('CV_org')
subplot(2,2,2),imshow(CV),title('CV')
subplot(2,2,3),imshow(cv_med1),title('CV medfilter 3*3')
subplot(2,2,4),imshow(cv_med2),title('CV medfilter 9*9')
figure(5),
subplot(2,2,1),imshow(CH_org),title('CH_org')
subplot(2,2,2),imshow(CH),title('CH')
subplot(2,2,3),imshow(ch_med1),title('CH medfilter 3*3')
subplot(2,2,4),imshow(ch_med2),title('CH medfilter 9*9')
figure(6),
subplot(2,2,1),imshow(CD_org),title('CD_org')
subplot(2,2,2),imshow(CD),title('CD')
subplot(2,2,3),imshow(cd_med1),title('CD medfilter 3*3')
subplot(2,2,4),imshow(cd_med2),title('CD medfilter 9*9')



re_img_med1 = idwt2(ca_med1, cv_med1, ch_med1, cd_med1, wn);
re_img_med1 = uint8(re_img_med1);
re_img_med2 = idwt2(ca_med2, cv_med2, ch_med2, cd_med2, wn);
re_img_med2 = uint8(re_img_med2);
figure(7),
subplot(1,2,1),imshow(re_img_med1)
subplot(1,2,2),imshow(re_img_med2)


















