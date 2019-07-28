function num_Si = Cal_Si(n,m)
% n is the number of players.
% m is the number of machines. And we set it greater than n. 
S0 = zeros(1,m-1);

% t = sort((round((rand(1,n)*18))+1)/2);
% t = ones(1,n);
% t = sort((round(rand(1,n)*10))+1);
t= [2 2 2 2 2 7 7 7 7];
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

S0 = [sort(S0) sum(S0);t]