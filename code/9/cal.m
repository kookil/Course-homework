function [y] = cal(x)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
L0=((x-15)/(10-15))*((x-20)/(10-20));
L1=((x-10)/(15-10))*((x-20)/(15-20));
L2=((x-10)/(20-10))*((x-15)/(20-15));
y=1*L0+1.1761*L1+1.3010*L2;
end
