%%�޸�ͼ��ֱ���
clear;clc;
X=inputdlg('���Ƿ��Ѿ��趨���˷ֱ��ʣ�������1��������0');
Y=str2num(cell2mat(X));       %��cell��XתΪ����Y
if Y==0
    fprintf('��ȷ�Ϸֱ����Ƿ�������ȷ��');
    break;                    %�⼸����Ϊ�˷�ֹ�ֱ���Ū��CG�޸Ĵ��ֵ�������ȡ
end
Path = pwd;                    %pwd�ɻ�ȡ��ǰ����Ŀ¼·��
imagePath = strcat(Path,'\');  %·����Ҫƴ��\����ȷ  
imageFiles = dir('*.png');     %��ȡĿ¼�ļ��µ�����ͼƬ�ļ�
% imageFiles = dir(imagePath);   %��ȡĿ¼�ļ��µ������ļ�
numFiles = length(imageFiles); %��ȡͼƬ������
for i=1:numFiles   %��ȡͼ�����������ǿ����ݣ�����i��3��ʼ          
    imageFile = strcat(imagePath,imageFiles(i).name);
     A = imread(imageFile); %%����ͼƬ
     sz = size(A);
     if sz(1,1)~=1080 | sz(1,2)~=1920 %�����ߴ�ǵ��޸�
        B = imresize(A,[1080 1920]);  %�޸�ͼƬ�ߴ�
%      if sz(1,1)~=720 | sz(1,2)~=1280 %�����ߴ�ǵ��޸�
%         B = imresize(A,[720 1280]);  %�޸�ͼƬ�ߴ�
        imwrite(B,imageFile); %%����ͼƬ 
        fprintf('��%d��ͼ��ķֱ����ѱ��޸�\n',i);
     end
end
 fprintf('ȫ��ͼ��ֱ����޸���ϣ�');
 %�������ʾ��������Ϊͼ��Ŀ¼�ﻹ�������ļ�������ʵ�ʷֱ��ʶ��޸ĺ���