function [an,index,Subsidy,difference] = playernot(n,S0)

% n is the quantity of players, and m is the number of machine.

% At first, we suppose m>n.

an = repmat(2,1,n);     %  非随机
% an = 2:5;

% used to storage values of each machine time.  升序 随机

% We define this vector as the characteristic vector.

% S0 = 9.5 ;  % 默认

% an2 = zeros(1,nchoosek(n,2));  %  必须分为一个和两个机器进行讨论

% for i = 1:nchoosek(n,2)
% 
%     bn = nchoosek(an,2); % 得到时间的排列组合 相乘即可
%
%     an2(i) = min(dot([2,1],bn(i,:))+S0 dot([1,1],bn(i,:))+2*S0); 
% 
%按照一个两个这样顺序
% end

ann = []; 
A = eye(n);
%  An是一个维数为(2^n-1,n)的矩阵;
f = (-1)*ones(n,1);

for i= 2:n-1
    y = perms(sum(A(1:i,:)));
    y = unique(y,'rows');  % 去除重复向量
    % 注意 y 需要翻转
    A  = [A;flipud(y)];  % 不断添加得到的矩阵
end
A = [A;ones(1,n)];     % 得到特征矩阵
    
for i = 1 : n                    % i是参与者数量
%  第一重循环找到所有k个参与者的所有组合 并且默认按数字顺序排序
    bn = zeros(1,nchoosek(n,i)); % 存储最终结果
    dn = zeros(1,i);
    cn = nchoosek(an,i);        % 存储排序结果
    for j = 1:nchoosek(n,i)   
        %  第二重循环对于其中的每一个组合得到结果
        for k = 1: i         % k是机器数量
            s = floor(i/k);  % 取商
            r = rem(i,k);
            a = (s+1):-1:1;
            repeat = k;      % 循环机器的次数
            tmp = repmat(a, repeat, 1);
            b = reshape(tmp, 1, length(a)*repeat);
            b(r+1:k) = [];
            dn(k) = dot(b,cn(j,:)) + k*S0;
        end
        % nm = find(dn==min(dn));  % 找出机器数量
        [minofdn index]=min(dn);
        % 我们取最小值
 %      disp(['the number of machine is ' num2str(index)]);
        bn(j) = min(dn);
    end                 
    ann = [ann bn];   % 也可以使用ann={};ann=[ann;{bn}] 调用ann 使用 ann{num}
                      % 但是最后需要将cell转化为向量

end

[x,y] = linprog(f,A,ann);

Subsidy = ann(end)+y

Taxation = index * (S0 - 9.5)

index

difference = Subsidy - Taxation;
