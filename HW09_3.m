clc; close all; clear all;

img = imread('1.jpg');

if length(size(img))==3
    img = rgb2gray(img);
end
%% initialize
var1 = 0.05;
var2 = 0.5;
med_window1 = [3,3];
wn = 'sym4';
num = 5;
[m,n] = size(img);
fignum = 0;

%% noised img
img_noise1 = imnoise(img,'salt & pepper', var1);
img_noise2 = imnoise(img,'salt & pepper', var2);


%% show img and img noised
fignum = fignum + 1;
figure(fignum),
subplot(1,3,1),imshow(img)
subplot(1,3,2),imshow(img_noise1)
subplot(1,3,3),imshow(img_noise2)



%% get dwt and save in cell arrays
mojak_temp_img = sotoohMojak(img, num, wn);
mojak_temp_img_noise1 = sotoohMojak(img_noise1, num, wn);
mojak_temp_img_noise2 = sotoohMojak(img_noise2, num, wn);
mojak_temp_img_noise_med1 = sotoohMojakToMedFilter(img_noise1, num, wn, med_window1);
mojak_temp_img_noise_med2 = sotoohMojakToMedFilter(img_noise2, num, wn, med_window1);



%% show cell arrays
for i=1:num
fignum = fignum + 1;
% figure('units','normalized','outerposition',[0 0 1 1])
figure(fignum),
subplot(2,3,1),imshow(uint8(cell2mat(mojak_temp_img(i,1)))),title('CA')
subplot(2,3,2),imshow(uint8(cell2mat(mojak_temp_img_noise1(i,1)))),title('CA nois')
subplot(2,3,3),imshow(uint8(cell2mat(mojak_temp_img_noise2(i,1)))),title('CA nois med')
subplot(2,3,4),imshow(uint8(cell2mat(mojak_temp_img(i,2)))),title('CV')
subplot(2,3,5),imshow(uint8(cell2mat(mojak_temp_img_noise1(i,2)))),title('CV nois')
subplot(2,3,6),imshow(uint8(cell2mat(mojak_temp_img_noise2(i,2)))),title('CV nois med')

fignum = fignum + 1;
% figure('units','normalized','outerposition',[0 0 1 1])
figure(fignum),
subplot(2,3,1),imshow(uint8(cell2mat(mojak_temp_img(i,3)))),title('CH')
subplot(2,3,2),imshow(uint8(cell2mat(mojak_temp_img_noise1(i,3)))),title('CH nois')
subplot(2,3,3),imshow(uint8(cell2mat(mojak_temp_img_noise2(i,3)))),title('CH nois med')
subplot(2,3,4),imshow(uint8(cell2mat(mojak_temp_img(i,4)))),title('CD')
subplot(2,3,5),imshow(uint8(cell2mat(mojak_temp_img_noise1(i,4)))),title('CD nois')
subplot(2,3,6),imshow(uint8(cell2mat(mojak_temp_img_noise2(i,4)))),title('CD nois med')
end

% 
% for i=1:num
% fignum = fignum + 1;
% % figure('units','normalized','outerposition',[0 0 1 1])
% figure(fignum),
% subplot(2,3,1),imshow(uint8(cell2mat(mojak_temp_img(i,1)))),title('CA filterd')
% subplot(2,3,2),imshow(uint8(cell2mat(mojak_temp_img_noise_med1(i,1)))),title('CA nois')
% subplot(2,3,3),imshow(uint8(cell2mat(mojak_temp_img_noise_med2(i,1)))),title('CA nois med')
% subplot(2,3,4),imshow(uint8(cell2mat(mojak_temp_img(i,2)))),title('CV')
% subplot(2,3,5),imshow(uint8(cell2mat(mojak_temp_img_noise_med1(i,2)))),title('CV nois')
% subplot(2,3,6),imshow(uint8(cell2mat(mojak_temp_img_noise_med2(i,2)))),title('CV nois med')
% 
% fignum = fignum + 1;
% % figure('units','normalized','outerposition',[0 0 1 1])
% figure(fignum),
% subplot(2,3,1),imshow(uint8(cell2mat(mojak_temp_img(i,3)))),title('CH filterd')
% subplot(2,3,2),imshow(uint8(cell2mat(mojak_temp_img_noise_med1(i,3)))),title('CH nois')
% subplot(2,3,3),imshow(uint8(cell2mat(mojak_temp_img_noise_med2(i,3)))),title('CH nois med')
% subplot(2,3,4),imshow(uint8(cell2mat(mojak_temp_img(i,4)))),title('CD')
% subplot(2,3,5),imshow(uint8(cell2mat(mojak_temp_img_noise_med1(i,4)))),title('CD nois')
% subplot(2,3,6),imshow(uint8(cell2mat(mojak_temp_img_noise_med2(i,4)))),title('CD nois med')
% end


% img_temp = mojakToImg(mojak_temp_img,wn);
% img_temp_noise = mojakToImg(mojak_temp_img_noise,wn);
% img_temp_noise_med = mojakToImgv2(mojak_temp_img_noise_med,wn);
% for i=1:num
% fignum = fignum + 1;
% figure(fignum),imshow(uint8(cell2mat(img_temp_noise_med(i))))
% end



