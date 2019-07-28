% This program is used to calculate the subsidy and taxation.

% Give the setup cost. And we know that the setup cost should be large enough, or the coalition will not exist.

function [Subsidy,nt] = mn(Sc)
% Give the number of players n = 4. At first, we set the number n =4 as default.
% Change the time cost of each player respectively. We had better set the
% number in order. Then we don't need find the minimum value.

t1 = 2 ; 
t2 = 3 ;
t3 = 4 ;
t4 = 5 ;

% Then Calculate the all coalition cost
c1 = Sc + t1 ; 
c2 = Sc + t2 ;
c3 = Sc + t3 ;
c4 = Sc + t4 ;
a12 = [c1+c2 t1*2+t2+Sc];
c12 = min(a12);
c13 = min([c1+c3 t1*2+t3+Sc]);
c14 = min([c1+c4 t1*2+t4+Sc]);
c23 = min([c2+c3 t2*2+t3+Sc]);
c24 = min([c2+c4 t2*2+t4+Sc]);
c34 = min([c3+c4 t3*2+t4+Sc]);
c123= min([c1+c2+c3 t1*3+t2*2+t3+Sc c12+c3 c13+c2 c23+c1]);
c124= min([c1+c2+c4 t1*3+t2*2+t4+Sc c12+c4 c14+c2 c24+c1]);
c134= min([c1+c3+c4 t1*3+t3*2+t4+Sc c13+c4 c14+c3 c34+c1]);
c234= min([c2+c3+c4 t2*3+t3*2+t4+Sc c23+c4 c24+c3 c34+c2]);
a1234= [c1+c2+c3+c4,t1*4+t2*3+t3*2+t4*1+Sc,c12+c3+c4,c13+c2+c4,c14+c2+c3,...
           c23+c1+c4,c24+c1+c3,c34+c1+c2,c12+c34,c13+c24,c14+c23];
% Find the index of mimimum
i = find(a1234==min(a1234));
nt = 1;
if sum(i == 2)
    disp('The number of machine is 1');
elseif sum(i == 1)
    nt = 4;
    disp('The number of machine is 4');
elseif sum(sum(i==9)+sum(i==10)+sum(i==11)) 
    nt = 2;
    disp('The number of machine is 2');
else
    nt = 3;
    disp('The number of machine is 3');
end

% [find,a]=min(a1234);
c1234=min(a1234); 

% Calculate the subsidy and taxation through the linear program methods.      
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
    0 1 1 1
    1 1 1 1];
b = [c1;c2;c3;c4;c12;c13;c14;c23;c24;c34;c123;c124;c134;c234;c1234];
% Calculate the subsidy    
[x,y] = linprog(f,a,b);

Subsidy = b(15)+y;


