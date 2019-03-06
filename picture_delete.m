%批量删除CG包里1280*720以外的图片
clear;clc;
imagePath = 'F:\PIXIV\visual\';%复制地址粘贴后要加\
List=dir(imagePath);
k=length(List);
for i=3:k  %不知为何有两个空的数据，所以从3开始
    imageFile = strcat(imagePath,List(i).name);
    image_data{i}=imread(imageFile);%image_data{i}是返回的第i个图像信息
    sz = size(image_data{i})
  if sz(1,1)~=720 | sz(1,2)~=1280 %如果比较sz~=[720 1280 3]返回的就不是单值了
%     if sz(1,1)~=576 | sz(1,2)~=1024 
        delete (imageFile);
    end
end
