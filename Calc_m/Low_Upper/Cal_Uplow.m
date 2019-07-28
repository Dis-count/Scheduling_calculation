% 沿用 players.m 的代码，修改 机器数量 m=2 的时候分别限制 m_s=1，2

function [an,index,Subsidy,difference] = Cal_Uplow(n,S0,an)


ann = []; 
A = eye(n);
%  An是一个维数为(2^n-1,n)的矩阵;
f = (-1)*ones(n,1);

a1 = ff2n(n);
b1 = sum(a1,2);
c1 = [a1,b1];
d1 = sortrows(c1,[n+1 1:n],'descend');  
e1 = sortrows(d1,n+1);
A = e1(:,1:n);
A(1,:) = [];  %删去第一行

% for i= 2:n-1
%     y = perms(sum(A(1:i,:)));
%     y = unique(y,'rows');  % 去除重复向量
%     % 注意 y 需要翻转
%     A  = [A;flipud(y)];  % 不断添加得到的矩阵
% end
% A = [A;ones(1,n)];     % 得到特征矩阵

 % k是机器数量
   
for i = 1 : n                    % i是参与者数量
%   第一重循环找到所有k个参与者的所有组合 并且默认按数字顺序排序
    if i < n
        k = 1;  % m_s  注意这里会得到和没有约束的原值一样的结果（图）  所以有理由相信对于限制条件处的机器数量使用都是 1
    else 
        k = 2;   % 注意m_v和m_s的区别
    end
    bn = zeros(1,nchoosek(n,i)); % 存储最终结果
    dn = zeros(1,k);
    cn = nchoosek(an,i);        % 存储排序结果
    for j = 1:nchoosek(n,i)   
        %  第二重循环对于其中的每一个组合得到结果
            s = floor(i/k);  % 取商
            r = rem(i,k);
            a = (s+1):-1:1;
            repeat = k;      % 循环机器的次数
            tmp = repmat(a, repeat, 1);
            b = reshape(tmp, 1, length(a)*repeat);
            b(r+1:k) = [];
            dn(k) = dot(b,cn(j,:)) + k*S0;
        
        % nm = find(dn==min(dn));  % 找出机器数量
        % [minofdn index]=min(dn);
        % 我们取最小值
        % disp(['the number of machine is ' num2str(index)]);
        bn(j) = dn(k) ;
    end                 
    ann = [ann bn];   % 也可以使用ann={};ann=[ann;{bn}] 调用ann 使用 ann{num}
                      % 但是最后需要将cell转化为向量

end

[x,y] = linprog(f,A,ann);

Subsidy = ann(end)+y;

index =k;

Taxation = k * (S0 - 9.5);

difference = Subsidy - Taxation;

