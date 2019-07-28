function [ss0,an] = Subs(n) 

% for i=1:n
% syms (['t',num2str(i)]);
% end

t = sym('t',[1,n]);

syms So
for k = 1: n         % k�ǻ�������
     s = floor(n/k);  % ȡ��
     r = rem(n,k);
     a = (s+1):-1:1;
     repeat = k;      % ѭ�������Ĵ���
     tmp = repmat(a, repeat, 1);
     b = reshape(tmp, 1, length(a)*repeat);
     b(r+1:k) = [];
     dn(k) = dot(b,t) + k*So;
end
% ���²����������
temp = dn(2:end);
    
temp(n) = 0; % ��0

ans = -temp + dn;

ans(end) = []; % �޳�������

% sym('t',[1,n]) = 1:n;

an = sort((round((rand(1,n)*18))+1)/2)  % ���� ti �������ֵ
% an = 1:14;

%an=[1 1 1.5 1.5 1.5 5 5.5 7 7.5 7.5 8];

g = subs(ans,sym('t',[1,n]),an);   % �����ű�����ֵ
    
ss0 = fliplr(subs(g,So,0));  % ��ʱ���õ� Sn...S2.

