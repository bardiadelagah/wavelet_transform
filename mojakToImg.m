function [output] = mojakToImg(mojak_temp, wn)
%MOJAKTOIMG Summary of this function goes here
%   Detailed explanation goes here
num = size(mojak_temp,1);
reimg = cell(num,1);
for i=num:-1:1
h = {idwt2(cell2mat(mojak_temp(i,1)), cell2mat(mojak_temp(i,2)), cell2mat(mojak_temp(i,3)),...
     cell2mat(mojak_temp(i,4)), wn)};
reimg(i,1) = h;
end
output = reimg;

end

