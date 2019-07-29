 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________       PSDS
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D myPSDS         SDS
0003.00 D   date                191    198
0004.00 D   jobName             244    253
0005.00 D   user                254    263
0006.00 D   jobNum              264    269S 0
0007.00  *
0008.00  /free
0009.00   dsply date;
0010.00   dsply jobName;
0011.00   dsply user;
0012.00   dsply jobNum;
0013.00   // There is also an INFDS and Data Area DS for more information
0014.00   *INLR = *ON;
0015.00  /end-free
        ****************** End of data ****************************************