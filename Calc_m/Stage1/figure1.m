
for num = 0:0.5:30
    [S1(2*num+1),D1(2*num+1)] = C1(num);
end
num = 0:0.5:30;
plot(num,S1,'b--*',num,D1,'r-o');
title('The Subsidy and difference with setup cost')
xlabel('The taxation increment') 
ylabel('Subsidy and difference value')
legend('Sub','Diff')
% plot(x,y1,'k:',x,y2,'b--',x1,y3,'rp');