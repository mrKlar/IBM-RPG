 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________    DSTMPLT
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D fullName        DS                  template qualified
0003.00 D  firstName                     10A
0004.00 D  lastName                      10A
0005.00  *
0006.00 D student         DS                  likeDS(fullName)
0007.00 D employee        DS                  likeDS(fullName)
0008.00  *
0009.00  /free
0010.00   student.firstName = 'Barrett';
0011.00   student.lastName = 'Otte';
0012.00
0013.00   


0014.00
0015.00   *INLR = *ON;
0016.00  /end-free
        ****************** End of data ****************************************