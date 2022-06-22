function [output] = sotoohMojak(img, num, wn)
%SOTOOHMOJAK Summary of this function goes here
%   Detailed explanation goes here

% wn = 'sym4';
% num = 5;
mojak_temp = cell(num,4);
temp = img;

for i=1:num
[CA_org, CV_org, CH_org, CD_org] = dwt2(temp,wn);
mojak_temp(i,1) = {CA_org};
mojak_temp(i,2) = {CV_org};
mojak_temp(i,3) = {CH_org};
mojak_temp(i,4) = {CD_org};
temp = CA_org;
end
output = mojak_temp;

end

