function [ss0,an] = Subs(n) 

% for i=1:n
% syms (['t',num2str(i)]);
% end

t = sym('t',[1,n]);

syms So
for k = 1: n         % k是机器数量
     s = floor(n/k);  % 取商
     r = rem(n,k);
     a = (s+1):-1:1;
     repeat = k;      % 循环机器的次数
     tmp = repmat(a, repeat, 1);
     b = reshape(tmp, 1, length(a)*repeat);
     b(r+1:k) = [];
     dn(k) = dot(b,t) + k*So;
end
% 以下步骤用于求差
temp = dn(2:end);
    
temp(n) = 0; % 补0

ans = -temp + dn;

ans(end) = []; % 剔除最后的数

% sym('t',[1,n]) = 1:n;

an = sort((round((rand(1,n)*18))+1)/2)  % 生成 ti 的随机数值
% an = 1:14;

%an=[1 1 1.5 1.5 1.5 5 5.5 7 7.5 7.5 8];

g = subs(ans,sym('t',[1,n]),an);   % 给符号变量赋值
    
ss0 = fliplr(subs(g,So,0));  % 此时求解得到 Sn...S2.

