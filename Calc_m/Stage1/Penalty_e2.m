% calculate the penalty of the taxation example

f = [0;0;0;0;1];
a1=[1 0 0 0 -1
    0 1 0 0 -1
    0 0 1 0 -1 
    0 0 0 1 -1
    1 1 0 0 -1
    1 0 1 0 -1
    1 0 0 1 -1
    0 1 1 0 -1
    0 1 0 1 -1
    0 0 1 1 -1
    1 1 1 0 -1
    1 1 0 1 -1
    1 0 1 1 -1
    0 1 1 1 -1];
aeq = [1,1,1,1,0];
beq = 38;
b1 = [11.5;12.5;13.5;14.5;16.5;17.5;18.5;19.5;20.5;22.5;25.5;26.5;28.5;31.5];
[x,y] = linprog(f,a1,b1,aeq,beq)

% Find the dissatisfaction
b1 - a1*x