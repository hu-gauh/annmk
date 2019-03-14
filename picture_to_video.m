%   生成视频
    clear;clc;
    tic %计时开始
%   imagePath = 'F:\金恋GT\evimage\';   %手动复制图像路径不方便
    Path = pwd;                         %pwd可获取当前工作目录路径
    imagePath = strcat(Path,'\');       %路径后还要拼接\才正确
    videoName = '金恋GT.avi';            %表示将要创建的视频文件的名字  
%   fps = 2;                             %设置帧率，感觉2好点，3在图片少时略鬼畜
    X=inputdlg('请输入视频帧率 (推荐为2)');
    fps=str2num(cell2mat(X));  
    startFrame = 1;                     %定义开始帧
    imageFiles = dir('*.png');               %括号内如果用imagePath，numFiles就超过图片数了（会把其它文件算进去）
    numFiles=length(imageFiles);        %计算图片总数，
    endFrame = numFiles;                 %最后一张图为结束帧
%   endFrame = 998;                      %或者自定义结束帧，但不能超出图片总数  
    if(exist('videoName','file'))  
        delete videoName.avi             % 判断下是否存在视频
    end  
    aviobj=VideoWriter(videoName);       %创建一个avi视频文件对象，开始时其为空  
    aviobj.FrameRate=fps;   
    open(aviobj);                        %打开文件写入视频数据
    for i=startFrame:endFrame            %读入图片
        fileName=sprintf('%04d',i);      %根据文件名而定，这里文件名是0001.jpg 0002.jpg
        frames=imread([imagePath,fileName,'.png']);  
        writeVideo(aviobj,frames);  
    end  
    close(aviobj);                          % 关闭创建视频
    fprintf('视频文件生成完毕，帧率为%d',fps);%生成的视频和图像在同目录
toc  %计时结束
disp(['程序运行时间: ',num2str(toc)]);
  


%%%视频分帧成图片 
%     clc,clear;
%     fileName = '1.avi';
%     obj = VideoReader(fileName);
%      numFrames = obj.NumberOfFrames;% 帧的总数
%      for k = 1 : numFrames% 读取数据
%      frame = read(obj,k);
%      imshow(frame);%显示帧
%      imwrite(frame,strcat(num2str(k),'.jpg'),'jpg');% 保存帧
%      end
%       %% 读取视频
%      video_file='***.avi';       %这里可以使用昨天小编教大家使用OPENCV自拍的视频为例哦
%      video=VideoReader(video_file);
%      frame_number=floor(video.Duration * video.FrameRate);  %获取帧数，为下面循环准备
%      %% 分离图片
%       for i=1:frame_number
%       image_name=strcat('****\', num2str(i));
%       image_name=strcat(image_name,'.jpg');
%          I=read(video,i);                       %读出图片
%          imwrite(I,image_name,'jpg');           %写图片
%          I=[];
%       end