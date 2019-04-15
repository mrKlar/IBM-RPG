 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________   FIZZBUZZ
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data ************************************* 
0001.00   /free
0002.00   // The classic fizzbuzz program in RPGLE Free
0003.00   dcl-s num int(10);
0004.00   for num = 1 to 100;
0005.00       if %rem(num:3) = 0 and %rem(num:5) = 0;
0006.00         dsply ('num - ' + %char(num) + ' FIZZBUZZ');
0007.00       elseif %rem(num:3) = 0;
0008.00         dsply ('num - ' + %char(num) + ' FIZZ');
0009.00       elseif %rem(num:5) = 0;
0010.00         dsply ('num - ' + %char(num) + ' BUZZ');
0011.00       else;
0012.00         dsply ('num - ' + %char(num));
0013.00       endif;
0014.00  endfor;
0015.00  *INLR = *ON;
        *****************  End of data ****************************************