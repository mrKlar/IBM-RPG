 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________     SCLARR
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data ************************************* 
0001.00   /free
0002.00   
0003.00   //RPG Arrays can only be 1 dimension
0004.00   //ISO format (yyyy-mm-dd)
0005.00
0006.00   dcl-s dates date(*iso) dim(3);
0007.00
0008.00   dates(1) = %date();                 //current date
0009.00   dates(2) = dates(1) + %days(1);     //tomorrow
0010.00   dates(3) = dates(1) + %years(1);    //next year
0011.00   dsply (%char(dates(1)) + ' '
0012.00        + %char(dates(2)) + ' '
0013.00        + %char(dates(3)));
0014.00
0015.00   return;
        *****************  End of data ****************************************