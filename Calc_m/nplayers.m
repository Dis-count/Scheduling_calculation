% This function is used to get excel to show the specific data.
function what = nplayers(m,n)
% m �����������
randomresult = zeros(m,n);

theresult=zeros(m,3);

count = 0

for i=1:m
    
    [a b c d] =players(n,9.5);  % �ظ�����
    if c<1E-12    % �ų� Subsidy=0 �����
        
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

