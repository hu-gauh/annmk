%   ������Ƶ
    clear;clc;
    tic %��ʱ��ʼ
%   imagePath = 'F:\����GT\evimage\';   %�ֶ�����ͼ��·��������
    Path = pwd;                         %pwd�ɻ�ȡ��ǰ����Ŀ¼·��
    imagePath = strcat(Path,'\');       %·����Ҫƴ��\����ȷ
    videoName = '����GT.avi';            %��ʾ��Ҫ��������Ƶ�ļ�������  
%   fps = 2;                             %����֡�ʣ��о�2�õ㣬3��ͼƬ��ʱ�Թ���
    X=inputdlg('��������Ƶ֡�� (�Ƽ�Ϊ2)');
    fps=str2num(cell2mat(X));  
    startFrame = 1;                     %���忪ʼ֡
    imageFiles = dir('*.png');               %�����������imagePath��numFiles�ͳ���ͼƬ���ˣ���������ļ����ȥ��
    numFiles=length(imageFiles);        %����ͼƬ������
    endFrame = numFiles;                 %���һ��ͼΪ����֡
%   endFrame = 998;                      %�����Զ������֡�������ܳ���ͼƬ����  
    if(exist('videoName','file'))  
        delete videoName.avi             % �ж����Ƿ������Ƶ
    end  
    aviobj=VideoWriter(videoName);       %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��  
    aviobj.FrameRate=fps;   
    open(aviobj);                        %���ļ�д����Ƶ����
    for i=startFrame:endFrame            %����ͼƬ
        fileName=sprintf('%04d',i);      %�����ļ��������������ļ�����0001.jpg 0002.jpg
        frames=imread([imagePath,fileName,'.png']);  
        writeVideo(aviobj,frames);  
    end  
    close(aviobj);                          % �رմ�����Ƶ
    fprintf('��Ƶ�ļ�������ϣ�֡��Ϊ%d',fps);%���ɵ���Ƶ��ͼ����ͬĿ¼
toc  %��ʱ����
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