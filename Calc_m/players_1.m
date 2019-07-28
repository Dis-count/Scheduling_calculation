% At first, we should set up an array to storage the number we need later.

%  ע��_1��������ȥ�������һ������ʽ������ 
function [an,index,Subsidy,difference] = players_1(n,S0,an)

% n is the quantity of players, and m is the number of machine.

% At first, we suppose m>n.

% an = 1:2:10;  

% an = sort((round((rand(1,n)*18))+1)/2);  %  ���� 0.5-10 ��0.5Ϊ����������

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

%  An��һ��ά��Ϊ(2^n-1,n)�ľ���;
f = (-1)*ones(n,1);

a1 = ff2n(n);
b1 = sum(a1,2);
c1 = [a1,b1];
d1 = sortrows(c1,[n+1 1:n],'descend');  
e1 = sortrows(d1,n+1);
A = e1(:,1:n);
A(1,:) = [];  %ɾȥ��һ��
A(end,:) = [];    

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
bnn = ann;
ann(end)=[]  % ȥ�����һ����������

[x,y] = linprog(f,A,ann);

Subsidy = bnn(end)+y;

Taxation = index * (S0 - 9.5);

difference = Subsidy - Taxation;

