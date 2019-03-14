%%修改图像分辨率
clear;clc;
X=inputdlg('您是否已经设定好了分辨率？是输入1，否输入0');
Y=str2num(cell2mat(X));       %将cell型X转为数字Y
if Y==0
    fprintf('请确认分辨率是否设置正确！');
    break;                    %这几句是为了防止分辨率弄错，CG修改错又得重新提取
end
Path = pwd;                    %pwd可获取当前工作目录路径
imagePath = strcat(Path,'\');  %路径后还要拼接\才正确  
imageFiles = dir('*.png');     %读取目录文件下的所有图片文件
% imageFiles = dir(imagePath);   %读取目录文件下的所有文件
numFiles = length(imageFiles); %获取图片的数量
for i=1:numFiles   %读取图像会多两个，是空数据，所以i从3开始          
    imageFile = strcat(imagePath,imageFiles(i).name);
     A = imread(imageFile); %%读入图片
     sz = size(A);
     if sz(1,1)~=1080 | sz(1,2)~=1920 %其它尺寸记得修改
        B = imresize(A,[1080 1920]);  %修改图片尺寸
%      if sz(1,1)~=720 | sz(1,2)~=1280 %其它尺寸记得修改
%         B = imresize(A,[720 1280]);  %修改图片尺寸
        imwrite(B,imageFile); %%保存图片 
        fprintf('第%d个图像的分辨率已被修改\n',i);
     end
end
 fprintf('全部图像分辨率修改完毕！');
 %最后若提示出错，是因为图像目录里还有其它文件，反正实际分辨率都修改好了