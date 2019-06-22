 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________   INTROSQL
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
 FMT H  HKeywords++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
0001.00 H
0002.00  *
 FMT F  FFilename++IPEASFRlen+LKlen+AIDevice+.Keywords+++++++++++++++++++++++++
0003.00 FstudPF    IF   E           K Disk
0004.00  *
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0005.00 D countDS         DS
0006.00 D  count1                        5S 0
0007.00 D  count2                        5S 0
0008.00 D dpt             S                   like(studDpt)
0009.00  *
0010.00 D myDS          E DS                  extName(studPF)
0011.00  *
0012.00  *
0012.00 /free
0013.00   dpt = 'IT'
0014.00
0015.00   exec sql
0016.00     SET option commit = *None;
0017.00   exec sql
0018.00     DECLARE c1 CURSOR FOR
0019.00       SELECT * FROM studPF WHERE studDpt = :dpt;
0020.00   exec sql
0021.00     OPEN c1;
0022.00   exec sql
0023.00     FETCH NEXT FROM c1 INTO :myDS;
0024.00   dow sqlcode = 0;
0025.00     exec sql
0026.00       FETCH NEXT FROM c1 INTO :myDS;
0027.00     dsply myDS;
0028.00   enddo;
0029.00
0030.00   exec sql
0031.00     SELECT COUNT(*),COUNT(DISTINCT studDpt)  
0032.00       INTO :countDS
0033.00       FROM studPF WHERE studDpt = :dpt;
0034.00   dsply count1;
0035.00   dsply count2;
0036.00
0037.00   *INLR=*ON;
0038.00 /end-free
        *****************  End of data ****************************************