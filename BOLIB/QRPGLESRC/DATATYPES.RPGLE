 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________  DATATYPES
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
!FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D num1            S              5S 0
0003.00 D num2            S              5P 0
0004.00 D num3            S              5S 2
0005.00 D num4            S              5P 3
0006.00 D date1           S               D
0007.00 D time1           S               T
0008.00 D timestamp       S               Z
0009.00 D flag            S              1N
0010.00 D PI              C                    3.14
0011.00 D name            S             20A
0011.00  *
0012.00  /free
0013.00    Eval num3 = 10/3;       // Eval(H) -> round up
0014.00    num4 = 10/3;
0015.00    num2 = 10**2;
0016.00    num1 = %Rem(14:5);
0017.00    Dsply num3;             // 333
0018.00    Dsply num4;             // 3333
0019.00    Dsply %Char(num3);      // 3.33
0020.00    Dsply %Char(num4);      // 3.333
0021.00    Dsply num2;             // 100
0022.00    Dsply num1;             // 
0023.00
0024.00    date1 = %Date();
0025.00    time1 = %Time();
0026.00    timestamp = %Timestamp();
0027.00    Dsply date1;
0028.00    Dsply time1;
0029.00    Dsply timestamp;
0030.00
0031.00    flag = *ON;             // *OFF
0032.00
0033.00    *INLR = *ON;
0034.00  /end-free
        ****************** End of data ****************************************