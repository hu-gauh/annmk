%��ȡ��S����ӛCG��������ɾ��1280*720�����ͼƬ
clear;clc;
imagePath = 'F:\PIXIV\visual\';%���Ƶ�ַճ����Ҫ��\
List=dir(imagePath);
k=length(List);
for i=3:k  %��֪Ϊ���������յ����ݣ����Դ�3��ʼ
    imageFile = strcat(imagePath,List(i).name);
    image_data{i}=imread(imageFile);%image_data{i}�Ƿ��صĵ�i��ͼ����Ϣ
    sz = size(image_data{i})
  if sz(1,1)~=720 | sz(1,2)~=1280 %����Ƚ�sz~=[720 1280 3]���صľͲ��ǵ�ֵ��
%     if sz(1,1)~=576 | sz(1,2)~=1024 
        delete (imageFile);
    end
end