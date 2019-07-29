 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________    EXCPSSR
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D A               S              2S 0 inz(10)
0003.00 D B               S              2S 0
0004.00 D C               S              2S 0
0005.00  /free
0006.00    c = a/b;
0007.00  /end-free
0008.00  /free
0009.00    begsr *PSSR;
0010.00      dump(A);
0011.00      dsply 'Something went wrong...';
0012.00      *INLR = *ON;
0013.00      return
0014.00    endsr;
0015.00  /end-free
        ****************** End of data ****************************************