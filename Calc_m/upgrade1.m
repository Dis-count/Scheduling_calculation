% M1 对0，1进行五维组合
h1 = 0:1;
h2 = 0:1;
h3 = 0:1;
h4 = 0:1;
h5 = 0:1;
[a,b,c,d,e] = ndgrid(h1,h2,h3,h4,h5);
length(a(:));
[a(:) b(:) c(:) d(:) e(:)];

% M2 利用二进制得到矩阵
dim = 10;
inputMatrix = dec2bin(1:2^dim-1);
outputMatrix = zeros(2^dim-1,dim);

% 注意由二进制得到的排列顺序在每个相同数量的1，0内需要反转 即逆序。 

for i = 1 : 2^dim-1
    temp = inputMatrix(i,:);
    outputMatrix(i,:) = str2num(temp(:))';
end

% 
% M3 对单位矩阵进行拆分和组合
A = eye(5);
a1 = A(1,:);
a2 = A(2,:);
a3 = A(3,:);
a4 = A(4,:);
a5 = A(5,:);


y = perms(a1+a2+a3);
y = unique(y,'rows');

% M4  利用ff2n 然后再排序得到矩阵

a = ff2n(4);
b = sum(a,2);
c = [a,b];
d = sortrows(c,[5 1:4],'descend');
sortrows(d,5);
e = d(: , 1:4);
%  sortrows(c,[5 1:4],{'ascend' 'descend''descend''descend''descend'})
%  当n比较大时，生成字符串序列麻烦。


% [~,I]=sort(A(:,5));   %假如对第5列进行升序排列  其中 I 是排序的order
% A=A(I,:);             %这样排列就完成了。