% This script is used to get slope values.

% aa = zeros(10,1);

for j=1:1  % This is used to get how many slope values we have under 10 random arrays. 

n =13;
% an =[4 4 5 5 7 8 9 10 12 13 14];  % result=10

an = sort((round((rand(1,n)*18))+1)/2); 

m =1;

% Calculate the slope value

k = 400;

theresult = zeros(k,2);

for i=1:k

        [a b c d] = players(n,0.5*(i-1)+50,an);
        
        theresult(i,1) = b;

        theresult(i,2) = c;
          
end

% ir = find(A(:,3)==10)         % ����������
% iv = A(find(A(:,3)==10),:)   % ������ֵ
 
subsidy = theresult(theresult(:,1)==m,:); % ѡ����������Ϊmʱ��subsidy

subsidy(:,1)=[];  % ɾȥ��ʾ�������ĵ�һ��

slope = zeros(1,length(subsidy)-1);

for i = 1:length(subsidy)-1
    if abs(subsidy(i+1)-subsidy(i))<1e-4
       slope(i) = 0;
        continue;
    end
    slope(i) = 2*(subsidy(i+1)-subsidy(i));

end

cc = 1:length(slope);

slope = slope';

myslope =[cc' slope];

t = builtin('_mergesimpts',myslope,[inf 0.002],'first');  % ��Ϊ��������

aa(j) = size(t,1)-1; % ��ȡ����

end
% unique(slope)
t