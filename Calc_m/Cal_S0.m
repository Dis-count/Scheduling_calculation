function num_S0 = Cal_S0(n,m,k)
% n is the number of players.
% m is the number of machines. And we set it greater than n. 
% t is the processing time of jobs.
% k is the number of x axis interval points.

S0 = zeros(1,m-1);
S = 0;

%  t = [2.5,5.5,6,6.5,7,8];
%  t = repmat(6,1,n);
t = [1.5,3,3.5,5,5.5,5.5,6.5,6.5,8.5,9];   %  [33.5,104]

% t = sort((round((rand(1,n)*18))+1)/2); 

for i = 1:m-1
    quotient = floor(n/i);  % 商即为每个机器job数量
    remainder = rem(n,i);   % 余数即为初始数值
    repeat = i ;  % 重复次数为机器的数量
    a = (quotient+1):-1:1 ;
    tmp = repmat(a,repeat,1);
    b = reshape(tmp,1,length(a)*repeat);
    b(remainder+1:i) = []; 
    
    
    quotient1 = floor(n/(i+1));
    remainder1 = rem(n,i+1);
    repeat1 = i+1;
    a1 = (quotient1+1):-1:1 ;
    tmp1 = repmat(a1,repeat1,1);
    b1 = reshape(tmp1,1,length(a1)*repeat1);
    b1(remainder1+1:i+1) = [];
    
    S0(i) = dot((b - b1),t);
end

% randomresult = zeros(k,n);

% theresult = zeros(k,3);

for i=1:k
    
    [a b c d] = players(n,S0(1)+0.5*i,t);

%     randomresult(i,:) = a;
    
%     theresult(i,1) = b;
% Because c is the subsidy, we want to find the setup cost 
% when subsidy is 0;
    
    if c<1e-10
        
        S = S0(1)+0.5*i;    
    break
    
    end
    
%  theresult(i,2) = c;
    
%  theresult(i,3) = d;
    
end
a = S - S0(1);
b = S0(1)-S0(2);
% S0;
cumsum(sort(S0))

S = [S S0;t]
% Compare the experimental result with the guessed result.