%ͼƬ�������������ʽ�޸�
clear;clc;
files = dir('*.png');%%д�������轫��������ͼƬ����ͬһĿ¼
len=length(files);
for i=1:len
    oldname=files(i).name;
    name=sprintf('%04d',i); 
    newname=strcat(name,'.png'); %�����׺дΪjpg��ͼƬ��ʽ�ͱ��޸�
    command = ['rename' 32 ,oldname,32 newname];
%   command = ['RENAME' 32 ,'"',oldname,'"',32 newname]; %���ͼƬ�ļ����пո񣬱����˫����
    status = dos(command);
    if status == 0
        disp([oldname, ' �ѱ�������Ϊ ', newname])
    else
        disp([oldname, ' ������ʧ��!'])
    end
end
fprintf('��������ϣ�');
