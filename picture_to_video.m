%%图片合成视频
clear;clc;
% %%保证图片分辨率全部一致
% imagePath = 'F:\PIXIV\备用\'; 
% imageFiles = dir(imagePath); %%读取目录文件下的所有图片文件
% numFiles = length(imageFiles);%%获取图片的数量
% for i=3:numFiles   %读取图像会多两个，是空数据，所以i从3开始          
%     j = i-2;
%     imageFile = strcat(imagePath,imageFiles(i).name);
%      A = imread(imageFile); %%读入图片
%      sz = size(A);
%      if sz(1,1)~=1080 | sz(1,2)~=1920
%         B = imresize(A,[1080 1920]); %%修改图片尺寸
%         imwrite(B,imageFile); %%保存图片 
%         fprintf('第%d个图像的分辨率已被修改\n',j);
%      end
% end
%  fprintf('全部图像分辨率修改完毕！');
%  %最后若提示出错，是因为目录里还有非图像文件不用管，实际分辨率都修改好了


%%接下来生成视频
tic %计时开始
framesPath = 'C:\Galgame\ev\';   %图像序列所在路径，同时要保证图像分辨率相同
    videoName = '金恋GT.avi';            %表示将要创建的视频文件的名字  
    fps = 2;                             %设置帧率，感觉2好点，3在图片少时略鬼畜
    startFrame = 1;                      %从哪一帧开始
    endFrame = 998;                      %哪一帧结束，不能超出图片总数  
    if(exist('videoName','file'))  
        delete videoName.avi             % 判断下是否存在视频，小编个人习惯
    end  
                  %生成视频的参数设定  
    aviobj=VideoWriter(videoName);       %创建一个avi视频文件对象，开始时其为空  
    aviobj.FrameRate=fps;   
    open(aviobj);                        %打开文件写入视频数据
    %读入图片  
        for  i=startFrame:endFrame       % for循环，从哪一帧到哪一帧
        fileName=sprintf('%04d',i);      %根据文件名而定 我这里文件名是0001.jpg 0002.jpg ....  
        frames=imread([framesPath,fileName,'.png']);  
        writeVideo(aviobj,frames);  
    end  
    close(aviobj);                       % 关闭创建视频
    fprintf('视频文件生成完毕，帧率为%d',fps);%生成的视频和图像在同目录
toc %计时结束
disp(['程序运行时间: ',num2str(toc)]);
  
%%%视频分帧成图片
%     clc,clear;
%     fileName = '1.avi';
%     obj = VideoReader(fileName);
%      numFrames = obj.NumberOfFrames; % 帧的总数
%      for k = 1 : numFrames  %读取数据
%      frame = read(obj,k);
%      imshow(frame);  %显示帧
%      imwrite(frame,strcat(num2str(k),'.jpg'),'jpg'); %保存帧
%      end
%      video_file='***.avi'; %读取视频
%      video=VideoReader(video_file);
%      frame_number=floor(video.Duration * video.FrameRate);  %获取帧数，为下面循环准备
%      %% 分离图片
%       for i=1:frame_number
%       image_name=strcat('****\', num2str(i));
%       image_name=strcat(image_name,'.jpg');
%          I=read(video,i);               %读出图片
%          imwrite(I,image_name,'jpg');   %写图片
%          I=[];
%       end
