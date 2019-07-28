% M1 ��0��1������ά���
h1 = 0:1;
h2 = 0:1;
h3 = 0:1;
h4 = 0:1;
h5 = 0:1;
[a,b,c,d,e] = ndgrid(h1,h2,h3,h4,h5);
length(a(:));
[a(:) b(:) c(:) d(:) e(:)];

% M2 ���ö����Ƶõ�����
dim = 10;
inputMatrix = dec2bin(1:2^dim-1);
outputMatrix = zeros(2^dim-1,dim);

% ע���ɶ����Ƶõ�������˳����ÿ����ͬ������1��0����Ҫ��ת ������ 

for i = 1 : 2^dim-1
    temp = inputMatrix(i,:);
    outputMatrix(i,:) = str2num(temp(:))';
end

% 
% M3 �Ե�λ������в�ֺ����
A = eye(5);
a1 = A(1,:);
a2 = A(2,:);
a3 = A(3,:);
a4 = A(4,:);
a5 = A(5,:);


y = perms(a1+a2+a3);
y = unique(y,'rows');

% M4  ����ff2n Ȼ��������õ�����

a = ff2n(4);
b = sum(a,2);
c = [a,b];
d = sortrows(c,[5 1:4],'descend');
sortrows(d,5);
e = d(: , 1:4);
%  sortrows(c,[5 1:4],{'ascend' 'descend''descend''descend''descend'})
%  ��n�Ƚϴ�ʱ�������ַ��������鷳��


% [~,I]=sort(A(:,5));   %����Ե�5�н�����������  ���� I �������order
% A=A(I,:);             %�������о�����ˡ�