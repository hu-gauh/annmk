%����ɾ��1280*720�����ͼƬ
clear;clc;
Path = pwd;                    %pwd�ɻ�ȡ��ǰ����Ŀ¼·��
imagePath = strcat(Path,'\');  %·����Ҫƴ��\����ȷ  
imageFiles = dir('*.png');     %��ȡĿ¼�ļ��µ�����ͼƬ�ļ�
numFiles = length(imageFiles); %��ȡͼƬ������
for i=1:numFiles
    imageFile = strcat(imagePath,imageFiles(i).name);
    image_data{i}=imread(imageFile);%image_data{i}�Ƿ��صĵ�i��ͼ����Ϣ
    sz = size(image_data{i})
  if sz(1,1)~=720 | sz(1,2)~=1280 %����Ƚ�sz~=[720 1280 3]���صľͲ��ǵ�ֵ��
%     if sz(1,1)~=576 | sz(1,2)~=1024 
      delete(imageFile);
   end
end