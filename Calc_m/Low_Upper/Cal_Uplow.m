% ���� players.m �Ĵ��룬�޸� �������� m=2 ��ʱ��ֱ����� m_s=1��2

function [an,index,Subsidy,difference] = Cal_Uplow(n,S0,an)


ann = []; 
A = eye(n);
%  An��һ��ά��Ϊ(2^n-1,n)�ľ���;
f = (-1)*ones(n,1);

a1 = ff2n(n);
b1 = sum(a1,2);
c1 = [a1,b1];
d1 = sortrows(c1,[n+1 1:n],'descend');  
e1 = sortrows(d1,n+1);
A = e1(:,1:n);
A(1,:) = [];  %ɾȥ��һ��

% for i= 2:n-1
%     y = perms(sum(A(1:i,:)));
%     y = unique(y,'rows');  % ȥ���ظ�����
%     % ע�� y ��Ҫ��ת
%     A  = [A;flipud(y)];  % ������ӵõ��ľ���
% end
% A = [A;ones(1,n)];     % �õ���������

 % k�ǻ�������
   
for i = 1 : n                    % i�ǲ���������
%   ��һ��ѭ���ҵ�����k�������ߵ�������� ����Ĭ�ϰ�����˳������
    if i < n
        k = 1;  % m_s  ע�������õ���û��Լ����ԭֵһ���Ľ����ͼ��  �������������Ŷ��������������Ļ�������ʹ�ö��� 1
    else 
        k = 2;   % ע��m_v��m_s������
    end
    bn = zeros(1,nchoosek(n,i)); % �洢���ս��
    dn = zeros(1,k);
    cn = nchoosek(an,i);        % �洢������
    for j = 1:nchoosek(n,i)   
        %  �ڶ���ѭ���������е�ÿһ����ϵõ����
            s = floor(i/k);  % ȡ��
            r = rem(i,k);
            a = (s+1):-1:1;
            repeat = k;      % ѭ�������Ĵ���
            tmp = repmat(a, repeat, 1);
            b = reshape(tmp, 1, length(a)*repeat);
            b(r+1:k) = [];
            dn(k) = dot(b,cn(j,:)) + k*S0;
        
        % nm = find(dn==min(dn));  % �ҳ���������
        % [minofdn index]=min(dn);
        % ����ȡ��Сֵ
        % disp(['the number of machine is ' num2str(index)]);
        bn(j) = dn(k) ;
    end                 
    ann = [ann bn];   % Ҳ����ʹ��ann={};ann=[ann;{bn}] ����ann ʹ�� ann{num}
                      % ���������Ҫ��cellת��Ϊ����

end

[x,y] = linprog(f,A,ann);

Subsidy = ann(end)+y;

index =k;

Taxation = k * (S0 - 9.5);

difference = Subsidy - Taxation;

