S = 9.5;

% 至于 含未知参数的 整数规划 如何求解还不知道

% fmincon 求解未知参数的非线性规划

t1 = 2;
 
t2 = 3;
 
t3 = 4;

t4 = 5;

n = 1:4;

f = [t1*n t2*n t3*n t4*n];

ic = [1:16];

A =[1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1;
    1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0;
                                    ];
% 注意    
b =[1;1;0;1;1];  % 此式决定了 s 小集合中包含了哪些 player（这里是 1，4）

lb = zeros(16,1);

ub = ones(16,1);

[x fval flag] = intlinprog(f,ic,[],[],A,b,lb,ub)  % flag 为退出标志

% [x, fval] = linprog(f,[],[],A,b,lb,ub)  % 对于 IPU 问题整数规划的解等于线性规划的解  