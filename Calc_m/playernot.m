function [an,index,Subsidy,difference] = playernot(n,S0)

% n is the quantity of players, and m is the number of machine.

% At first, we suppose m>n.

an = repmat(2,1,n);     %  �����
% an = 2:5;

% used to storage values of each machine time.  ���� ���

% We define this vector as the characteristic vector.

% S0 = 9.5 ;  % Ĭ��

% an2 = zeros(1,nchoosek(n,2));  %  �����Ϊһ��������������������

% for i = 1:nchoosek(n,2)
% 
%     bn = nchoosek(an,2); % �õ�ʱ���������� ��˼���
%
%     an2(i) = min(dot([2,1],bn(i,:))+S0 dot([1,1],bn(i,:))+2*S0); 
% 
%����һ����������˳��
% end

ann = []; 
A = eye(n);
%  An��һ��ά��Ϊ(2^n-1,n)�ľ���;
f = (-1)*ones(n,1);

for i= 2:n-1
    y = perms(sum(A(1:i,:)));
    y = unique(y,'rows');  % ȥ���ظ�����
    % ע�� y ��Ҫ��ת
    A  = [A;flipud(y)];  % ������ӵõ��ľ���
end
A = [A;ones(1,n)];     % �õ���������
    
for i = 1 : n                    % i�ǲ���������
%  ��һ��ѭ���ҵ�����k�������ߵ�������� ����Ĭ�ϰ�����˳������
    bn = zeros(1,nchoosek(n,i)); % �洢���ս��
    dn = zeros(1,i);
    cn = nchoosek(an,i);        % �洢������
    for j = 1:nchoosek(n,i)   
        %  �ڶ���ѭ���������е�ÿһ����ϵõ����
        for k = 1: i         % k�ǻ�������
            s = floor(i/k);  % ȡ��
            r = rem(i,k);
            a = (s+1):-1:1;
            repeat = k;      % ѭ�������Ĵ���
            tmp = repmat(a, repeat, 1);
            b = reshape(tmp, 1, length(a)*repeat);
            b(r+1:k) = [];
            dn(k) = dot(b,cn(j,:)) + k*S0;
        end
        % nm = find(dn==min(dn));  % �ҳ���������
        [minofdn index]=min(dn);
        % ����ȡ��Сֵ
 %      disp(['the number of machine is ' num2str(index)]);
        bn(j) = min(dn);
    end                 
    ann = [ann bn];   % Ҳ����ʹ��ann={};ann=[ann;{bn}] ����ann ʹ�� ann{num}
                      % ���������Ҫ��cellת��Ϊ����

end

[x,y] = linprog(f,A,ann);

Subsidy = ann(end)+y

Taxation = index * (S0 - 9.5)

index

difference = Subsidy - Taxation;
