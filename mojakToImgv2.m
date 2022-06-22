function [output] = mojakToImgv2(mojak_temp, wn)
%MOJAKTOIMG Summary of this function goes here
%Detailed explanation goes here
num = size(mojak_temp,1);
reimg = cell(num,1);

temp = cell2mat(mojak_temp(num,1));
for i=num:-1:1
disp(i);    
disp(size(cell2mat(mojak_temp(i,4))));
temp = idwt2(temp, cell2mat(mojak_temp(i,2)), cell2mat(mojak_temp(i,3)),...
     cell2mat(mojak_temp(i,4)), wn);
disp(size(temp));
h = {temp};
reimg(i,1) = h;
% temp = f; 
end
output = reimg;


end

