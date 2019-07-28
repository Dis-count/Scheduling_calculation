% calculate the subsidy for example2
function difference = iteration(num)
    
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
b = [11.5;12.5;13.5;14.5;16.5;17.5;18.5;19.5;20.5;22.5;25.5;26.5;28.5;31.5];
b = b + num;
[x,y] = linprog(f,a,b);
x
difference = -y-38-num*2;

%  b - a*x   give every player cost
