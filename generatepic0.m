function nothing = generatepic0(k)

% m is the number of pictures you want generate.
% k is the number of x axis interval points. 280
an = [1 2 2 3 4.5 5 5.5 5.5 6 7];

randomresult = zeros(k,10);

theresult = zeros(k,3);

for i=1:k
    
    [a b c d] = players(10,0.5*(i-1),an);

    randomresult(i,:) = a;
    theresult(i,1) = b;
    theresult(i,2) = c;
    theresult(i,3) = d;

end

% result = [randomresult,theresult];

    x = 1*(0:0.5:k/2-0.5);

% plot(x,theresult(1:100,1),'r-o',x,theresult(1:100,2),'b--*',x,theresult(1:100,3),'m-s');

% 画两个坐标轴

    yyaxis left
    plot(x,theresult(1:k,1),'r-o',x,theresult(1:k,2),'b--*')

    ylabel('机器数量 & 补贴值')
    
    yyaxis right
    plot(x,theresult(1:k,3),'m-+')
    ylim([-120 80])

    xlabel('定价')

    ylabel('补贴-征税值')
    
    legend('机器数量','补贴','补贴-征税','Location','Best');
    % title(num2str(an))

    % h = figure(1);
    
% figure(1),plot(x,theresult(1:100,1),'r-o',x,theresult(1:100,2),'b--*');
    
   % pn = sprintf('Pic%03i.jpg',j);
   % print(gcf, '-djpeg', pn)
    

    print(gcf,'-djpeg',['Figures\Image0.jpg']);

% imwrite(vectors,'test1.png')

%  figure(2),plot(x,theresult(1:100,3),'m-.');