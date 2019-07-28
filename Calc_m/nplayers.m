% This function is used to get excel to show the specific data.
function what = nplayers(m,n)
% m 随机向量数量
randomresult = zeros(m,n);

theresult=zeros(m,3);

count = 0

for i=1:m
    
    [a b c d] =players(n,9.5);  % 重复调用
    if c<1E-12    % 排除 Subsidy=0 的情况
        
        randomresult(i-count,:) = [];
        theresult(i-count,:) = [];
        count = count+1;
        continue
    else
    randomresult(i-count,:) = a;
    theresult(i-count,1) = b;
    theresult(i-count,2) = c;
    theresult(i-count,3) = d;

    end
end

result = [randomresult,theresult];

xlswrite('F:\Program Files\m1',result);

