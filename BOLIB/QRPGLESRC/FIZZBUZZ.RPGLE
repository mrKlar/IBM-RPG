       /free
       // The classic fizzbuzz program in RPGLE Free
       dcl-s num int(10);

       for num = 1 to 100;
           if %REM(num:3) = 0 and %REM(num:5) = 0;
               dsply ('num - ' + %char(num) + ' FIZZBUZZ');
           elseif %rem(num:3) = 0;
               dsply ('num - ' + %char(num) + ' FIZZ');
           elseif %rem(num:5) = 0;
               dsply ('num - ' + %char(num) + ' BUZZ');
           else;
               dsply ('num - ' + %char(num));
           endif;
       endfor;
       *INLR = *ON;