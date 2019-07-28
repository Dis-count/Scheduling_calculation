% calculate the taxation for example2 when core is non-empty
function difference = iteration(num)
% num must be positive    
f = [-1;-1;-1;-1];
a= [1 0 0 1
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
    0 1 1 1
    1 1 1 1];
b = [11.5;12.5;13.5;14.5;16.5;17.5;18.5;19.5;20.5;22.5;25.5;26.5;28.5;31.5;38];
if num <= 1.5
    b = b + num;
    b(15)= b(15) +num;
else
    b = b + num;
    b(15) = 41+(num-1.5);
end
[x,y] = linprog(f,a,b);
y
b(15)
difference = -y-b(15);
% That difference is negative means this coalition need subsidy

%  b - a*x   give every player cost
