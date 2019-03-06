%图片批量重命名与格式修改
clear;clc;
files = dir('*.png');%%写成这样需将本程序与图片置于同一目录
len=length(files);
for i=1:len
    oldname=files(i).name;
    name=sprintf('%04d',i); 
    newname=strcat(name,'.png'); %如果后缀写为jpg，图片格式就被修改
    command = ['rename' 32 ,oldname,32 newname];
%   command = ['RENAME' 32 ,'"',oldname,'"',32 newname]; %如果图片文件名有空格，必须加双引号
    status = dos(command);
    if status == 0
        disp([oldname, ' 已被重命名为 ', newname])
    else
        disp([oldname, ' 重命名失败!'])
    end
end
fprintf('重命名完毕！');
