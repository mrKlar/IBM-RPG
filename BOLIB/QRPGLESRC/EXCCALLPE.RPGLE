 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________  EXCCALLPE
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D pgm             PR                  extPgm('XYZ')
0005.00  /free
0006.00    callP(E) pgm();
0007.00    if %error();
0008.00      dsply 'Error calling pgm.';
0009.00    endif;
0010.00    *INLR = *ON;
0015.00  /end-free
        ****************** End of data ****************************************