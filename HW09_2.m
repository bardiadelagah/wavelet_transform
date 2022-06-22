clc; close all; clear all;

img = imread('1.jpg');

if length(size(img))==3
    img = rgb2gray(img);
end
%% initialize
var = 0.05;
med_window1 = [3,3];
wn = 'sym4';
num = 5;
[m,n] = size(img);
img_noise = imnoise(img,'salt & pepper', var);
fignum = 0;


%% show img and img noised
fignum = fignum + 1;
figure(fignum),
subplot(1,2,1),imshow(img)
subplot(1,2,2),imshow(img_noise)


%% get dwt and save in cell arrays
mojak_temp_img = sotoohMojak(img, num, wn);
mojak_temp_img_noise = sotoohMojak(img_noise, num, wn);
mojak_temp_img_noise_med = sotoohMojakToMedFilter(img_noise, num, wn, med_window1);


%% show cell arrays
for i=1:num
fignum = fignum + 1;
% figure('units','normalized','outerposition',[0 0 1 1])
figure(fignum),
subplot(2,3,1),imshow(uint8(cell2mat(mojak_temp_img(i,1)))),title('CA')
subplot(2,3,2),imshow(uint8(cell2mat(mojak_temp_img_noise(i,1)))),title('CA nois')
subplot(2,3,3),imshow(uint8(cell2mat(mojak_temp_img_noise_med(i,1)))),title('CA nois med')
subplot(2,3,4),imshow(uint8(cell2mat(mojak_temp_img(i,2)))),title('CV')
subplot(2,3,5),imshow(uint8(cell2mat(mojak_temp_img_noise(i,2)))),title('CV nois')
subplot(2,3,6),imshow(uint8(cell2mat(mojak_temp_img_noise_med(i,2)))),title('CV nois med')

fignum = fignum + 1;
% figure('units','normalized','outerposition',[0 0 1 1])
figure(fignum),
subplot(2,3,1),imshow(uint8(cell2mat(mojak_temp_img(i,3)))),title('CH')
subplot(2,3,2),imshow(uint8(cell2mat(mojak_temp_img_noise(i,3)))),title('CH nois')
subplot(2,3,3),imshow(uint8(cell2mat(mojak_temp_img_noise_med(i,3)))),title('CH nois med')
subplot(2,3,4),imshow(uint8(cell2mat(mojak_temp_img(i,4)))),title('CD')
subplot(2,3,5),imshow(uint8(cell2mat(mojak_temp_img_noise(i,4)))),title('CD nois')
subplot(2,3,6),imshow(uint8(cell2mat(mojak_temp_img_noise_med(i,4)))),title('CD nois med')
end




% img_temp = mojakToImg(mojak_temp_img,wn);
% img_temp_noise = mojakToImg(mojak_temp_img_noise,wn);
% img_temp_noise_med = mojakToImgv2(mojak_temp_img_noise_med,wn);
% for i=1:num
% fignum = fignum + 1;
% figure(fignum),imshow(uint8(cell2mat(img_temp_noise_med(i))))
% end



