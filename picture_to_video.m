%%ͼƬ�ϳ���Ƶ
clear;clc;
% %%��֤ͼƬ�ֱ���ȫ��һ��
% imagePath = 'F:\PIXIV\����\'; 
% imageFiles = dir(imagePath); %%��ȡĿ¼�ļ��µ�����ͼƬ�ļ�
% numFiles = length(imageFiles);%%��ȡͼƬ������
% for i=3:numFiles   %��ȡͼ�����������ǿ����ݣ�����i��3��ʼ          
%     j = i-2;
%     imageFile = strcat(imagePath,imageFiles(i).name);
%      A = imread(imageFile); %%����ͼƬ
%      sz = size(A);
%      if sz(1,1)~=1080 | sz(1,2)~=1920
%         B = imresize(A,[1080 1920]); %%�޸�ͼƬ�ߴ�
%         imwrite(B,imageFile); %%����ͼƬ 
%         fprintf('��%d��ͼ��ķֱ����ѱ��޸�\n',j);
%      end
% end
%  fprintf('ȫ��ͼ��ֱ����޸���ϣ�');
%  %�������ʾ��������ΪĿ¼�ﻹ�з�ͼ���ļ����ùܣ�ʵ�ʷֱ��ʶ��޸ĺ���


%%������������Ƶ
tic %��ʱ��ʼ
framesPath = 'C:\Galgame\ev\';   %ͼ����������·����ͬʱҪ��֤ͼ��ֱ�����ͬ
    videoName = '����GT.avi';            %��ʾ��Ҫ��������Ƶ�ļ�������  
    fps = 2;                             %����֡�ʣ��о�2�õ㣬3��ͼƬ��ʱ�Թ���
    startFrame = 1;                      %����һ֡��ʼ
    endFrame = 998;                      %��һ֡���������ܳ���ͼƬ����  
    if(exist('videoName','file'))  
        delete videoName.avi             % �ж����Ƿ������Ƶ��С�����ϰ��
    end  
                  %������Ƶ�Ĳ����趨  
    aviobj=VideoWriter(videoName);       %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��  
    aviobj.FrameRate=fps;   
    open(aviobj);                        %���ļ�д����Ƶ����
    %����ͼƬ  
        for  i=startFrame:endFrame       % forѭ��������һ֡����һ֡
        fileName=sprintf('%04d',i);      %�����ļ������� �������ļ�����0001.jpg 0002.jpg ....  
        frames=imread([framesPath,fileName,'.png']);  
        writeVideo(aviobj,frames);  
    end  
    close(aviobj);                       % �رմ�����Ƶ
    fprintf('��Ƶ�ļ�������ϣ�֡��Ϊ%d',fps);%���ɵ���Ƶ��ͼ����ͬĿ¼
toc %��ʱ����
disp(['��������ʱ��: ',num2str(toc)]);
  
%%%��Ƶ��֡��ͼƬ
%     clc,clear;
%     fileName = '1.avi';
%     obj = VideoReader(fileName);
%      numFrames = obj.NumberOfFrames;% ֡������
%      for k = 1 : numFrames% ��ȡ����
%      frame = read(obj,k);
%      imshow(frame);%��ʾ֡
%      imwrite(frame,strcat(num2str(k),'.jpg'),'jpg');% ����֡
%      end
%       %% ��ȡ��Ƶ
%      video_file='***.avi';       %�������ʹ������С��̴��ʹ��OPENCV���ĵ���ƵΪ��Ŷ
%      video=VideoReader(video_file);
%      frame_number=floor(video.Duration * video.FrameRate);  %��ȡ֡����Ϊ����ѭ��׼��
%      %% ����ͼƬ
%       for i=1:frame_number
%       image_name=strcat('****\', num2str(i));
%       image_name=strcat(image_name,'.jpg');
%          I=read(video,i);                       %����ͼƬ
%          imwrite(I,image_name,'jpg');           %дͼƬ
%          I=[];
%       end