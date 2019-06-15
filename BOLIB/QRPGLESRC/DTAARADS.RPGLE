 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________   DTAARADS
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D LDADS1         UDS           200    DTAARA(*LDA)
0003.00 D   name                 11     20
0004.00  *
0005.00  /free
0006.00    dsply name; // name will be index 11 to 20 in data area of *LDA
0007.00
0008.00   *INLR = *ON;
0009.00  /end-free
        ****************** End of data ****************************************