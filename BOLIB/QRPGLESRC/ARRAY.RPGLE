 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________      ARRAY
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D arr             S              3S 0 Dim(10)
0003.00 D i               S              2S 0
0004.00
0005.00  /free
0006.00
0007.00   for i=1 to 10;
0008.00     arr(i) = i;
0009.00   endfor;
0010.00
0011.00   for i=1 to %elem(arr);
0012.00     arr(i) = i;
0013.00     dsply arr(i);
0014.00   endfor;
0015.00
0016.00   idx = %lookup(8:arr);
0017.00   dsply idx;


xxxx.00   *INLR = *ON;
xxxx.00  /end-free
        ****************** End of data ****************************************