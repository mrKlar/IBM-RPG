 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________   DSOVERLY
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D myDS            DS                  qualified
0003.00 D   fld1                         3A   inz('ABC')
0004.00 D   fld2                         3A   inz('123')
0005.00 D   fld3                         3A   inz('XYZ')
0006.00 D   fldOv                        3A   dim(3) overlay(myDS)
0007.00 D   fldX                         2A   overlay(fld2)
0008.00 D   fldY               4         7A   
0009.00  *
0010.00  /free
0011.00   dsply myDs;
0012.00   dsply myDs.fldOv; // array of fld1,fld2,fld3
0013.00   dsply myDs.fldX;  // 12
0014.00   dsply myDs.fldY;  // 123X
0015.00   *INLR = *ON;
0016.00  /end-free
        ****************** End of data ****************************************