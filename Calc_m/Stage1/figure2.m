for SC = 0:0.5:30
    [S(2*SC+1),nt1(2*SC+1)] = machine_number(SC);
end
SC = 0:0.5:30;
plot(SC,S,'b--*',SC,nt1,'r-o');
title('The Subsidy and number of machine with setup cost')
xlabel('The setup cost') 
ylabel('Subsidy and machine number')
legend('Sub','machine number')
% plot(x,y1,'k:',x,y2,'b--',x1,y3,'rp');