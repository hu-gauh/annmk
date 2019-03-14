%批量删除1280*720以外的图片
clear;clc;
Path = pwd;                    %pwd可获取当前工作目录路径
imagePath = strcat(Path,'\');  %路径后还要拼接\才正确  
imageFiles = dir('*.png');     %读取目录文件下的所有图片文件
numFiles = length(imageFiles); %获取图片的数量
for i=1:numFiles
    imageFile = strcat(imagePath,imageFiles(i).name);
    image_data{i}=imread(imageFile);%image_data{i}是返回的第i个图像信息
    sz = size(image_data{i})
  if sz(1,1)~=720 | sz(1,2)~=1280 %如果比较sz~=[720 1280 3]返回的就不是单值了
%     if sz(1,1)~=576 | sz(1,2)~=1024 
      delete(imageFile);
   end
end