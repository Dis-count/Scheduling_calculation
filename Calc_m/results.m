n=4;
randomresult = zeros(200,4);

theresult=zeros(200,3);

count = 0;

for i=1:200
    
    [a b c d] =players(n,9.5);
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

xlswrite('F:\Program Files\n4S0',result);

% n=5;
% 
% randomresult = zeros(100,5);
% theresult=zeros(100,3);
% 
% for i=1:100
%     [randomresult(i,:),theresult(i,1),theresult(i,2),theresult(i,3)] =players(n,9.5);
% end
% result = [randomresult,theresult];
% xlswrite('F:\Program Files\Matlab files',result);
clear

n=5;

randomresult = zeros(100,5);

theresult=zeros(100,3);

count = 0

for i=1:100
    
    [a b c d] =players(n,9.5);
    if c==0    % 排除 Subsidy=0 的情况
        
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

xlswrite('F:\Program Files\n5S0',result);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=4;

randomresult = zeros(350,4);

theresult = zeros(350,3);


for i=1:350
    
    [a b c d] = playernot(n,0.1*i);

    randomresult(i,:) = a;
    theresult(i,1) = b;
    theresult(i,2) = c;
    theresult(i,3) = d;


end

result = [randomresult,theresult];

x = 0.1*(1:180);
plot(x,theresult(1:180,1),'r-o',x,theresult(1:180,2),'b--*',x,theresult(1:180,3),'y-s');



%   xlswrite('F:\Program Files\n4+5S0+',result);