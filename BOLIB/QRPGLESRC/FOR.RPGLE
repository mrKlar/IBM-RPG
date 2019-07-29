      /free
       dcl-s num int(10);
   
       for num = 1 to 3;
         dsply ('i = ' + %char(num));
       endfor;
       for num = 5 downto 1 by 1;
         dsply ('i = ' + %char(num));
       endfor;

       return;