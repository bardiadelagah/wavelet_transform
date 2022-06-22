function [output] = sotoohMojakToMedFilter(img, num, wn, med_window1)
%SOTOOHMOJAK Summary of this function goes here
%   Detailed explanation goes here

% wn = 'sym4';
% num = 5;
mojak_temp = cell(num,4);
mojak_temp_img_noise_med = cell(num,4);
temp = img;

for i=1:num
[CA_org, CV_org, CH_org, CD_org] = dwt2(temp,wn);
% ca_med1 = medfilt2(CA_org,med_window1);
% cv_med1 = medfilt2(CV_org,med_window1);
% ch_med1 = medfilt2(CH_org,med_window1);
% cd_med1 = medfilt2(CD_org,med_window1);
mojak_temp(i,1) = {CA_org};
mojak_temp(i,2) = {CV_org};
mojak_temp(i,3) = {CH_org};
mojak_temp(i,4) = {CD_org};
temp = CA_org;
end


for i=1:num   
ca_med1 = medfilt2(cell2mat(mojak_temp(i,1)),med_window1);
cv_med1 = medfilt2(cell2mat(mojak_temp(i,2)),med_window1);
ch_med1 = medfilt2(cell2mat(mojak_temp(i,3)),med_window1);
cd_med1 = medfilt2(cell2mat(mojak_temp(i,4)),med_window1);
mojak_temp_img_noise_med(i,1) = {ca_med1};
mojak_temp_img_noise_med(i,2) = {cv_med1};
mojak_temp_img_noise_med(i,3) = {ch_med1};
mojak_temp_img_noise_med(i,4) = {cd_med1};
end

output = mojak_temp_img_noise_med;
% output = mojak_temp;
end

