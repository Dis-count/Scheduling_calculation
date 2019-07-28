function nothing = generatepic(m,k,n)

% m is the number of pictures you want generate.
% k is the number of x axis interval points.
% n is the number of players.

%n=7;
for j=1:m

    an = sort((round((rand(1,n)*18))+1)/2); 

    randomresult = zeros(k,n);

    theresult = zeros(k,3);


    for i=1:k
    
        [a b c d] = players_1(n,0.5*i,an);

        randomresult(i,:) = a;
        theresult(i,1) = b;
        theresult(i,2) = c;
        theresult(i,3) = d;


    end

    % result = [randomresult,theresult];

    x = 0.5*(1:k);

% plot(x,theresult(1:100,1),'r-o',x,theresult(1:100,2),'b--*',x,theresult(1:100,3),'m-s');

% »­Á½¸ö×ø±êÖá

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
    

    print(gcf,'-djpeg',['Figures\Image',num2str(j),'.jpg']);

end
% imwrite(vectors,'test1.png')

%  figure(2),plot(x,theresult(1:100,3),'m-.');