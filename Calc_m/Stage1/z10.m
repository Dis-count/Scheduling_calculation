f = [-1;-1;-1;-1];
a= [1 0 0 0
    0 1 0 0
    0 0 1 0
    0 0 0 1
    1 1 0 0
    1 0 1 0
    1 0 0 1
    0 1 1 0
    0 1 0 1
    0 0 1 1
    1 1 1 0
    1 1 0 1
    1 0 1 1
    0 1 1 1];
b = [20;18;14;8;53;44;33;44;32;29;89;72;64;65];

[x,y] = linprog(f,a,b+10);
x ,y = 115+y