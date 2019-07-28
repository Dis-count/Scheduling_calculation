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

% ir = find(A(:,3)==10)         % 返回行索引
% iv = A(find(A(:,3)==10),:)   % 返回数值
 
subsidy = theresult(theresult(:,1)==m,:); % 选出当机器数为m时的subsidy

subsidy(:,1)=[];  % 删去表示机器数的第一列

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

t = builtin('_mergesimpts',myslope,[inf 0.002],'first');  % 需为两列数据

aa(j) = size(t,1)-1; % 获取行数

end
% unique(slope)
t