function nothing = Plot_Uplow(k,n)

% 只画一张图

% k is the number of x axis interval points.

% n is the number of players.

    
%    an = repmat(6,1,n);

   an = [1.5,3,3.5,5,5.5,5.5,6.5,6.5,8.5,9];  % [182.5 104 33.5]

%   an = [2.5,5.5,6,6.5,7,8];  % 对应S_0为 [2.5 5.5 6 14.5 44 72.5].

    randomresult = zeros(k,n);

    theresult = zeros(k,3);


    for i=1:k
      % [a b c d] = players(n,1*(i-1),an);     %   注意调用不同函数的区别  此为正常求解
      [a b c d] = Cal_Uplow(n,33.5+1*(i-1),an);   %   此为求下界

        randomresult(i,:) = a;
        theresult(i,1) = b;
        theresult(i,2) = c;
        theresult(i,3) = d;


    end

    % result = [randomresult,theresult];

    x = 1*(0:k-1);

% plot(x,theresult(1:100,1),'r-o',x,theresult(1:100,2),'b--*',x,theresult(1:100,3),'m-s');

% 画两个坐标轴

    yyaxis left
    plot(x,theresult(1:k,1),'r-o',x,theresult(1:k,2),'b--*')


    yyaxis right
    plot(x,theresult(1:k,3),'m-+')
    ylim([-100 80])

    title(num2str(an))

    % h = figure(1);
    
% figure(1),plot(x,theresult(1:100,1),'r-o',x,theresult(1:100,2),'b--*');
    
   % pn = sprintf('Pic%03i.jpg',j);
   % print(gcf, '-djpeg', pn)
    

    print(gcf,'-djpeg',['Figures\Imagek_3','.jpg']);

% imwrite(vectors,'test1.png')

%  figure(2),plot(x,theresult(1:100,3),'m-.');