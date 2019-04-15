 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________      HXCVT
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++
        *************** Beginning of data ************************************* 
0001.00 FHXCVTDSP  CF   E             WORKSTN
0002.00  /FREE
0003.00    EXFMT RECORD1;
0004.00    DOW NOT(*IN03);
0005.00      EXSR GETNUM;
0006.00      WRITE RECORD1;
0007.00      EXFMT RECORD2;
0008.00      IF(*IN03 = *OFF);
0009.00        EXSR CLRCVT;
0010.00        EXFMT RECORD1;
0011.00      ENDIF;
0012.00    ENDDO;
0013.00    *INLR = *ON;
0014.00    RETURN;
0015.00
0016.00    BEGSR GETNUM;
0017.00      DNUM = 0;
0018.00      SELECT;
0019.00        WHEN(HNUM = 'A');
0020.00          DNUM = 10;
0021.00        WHEN(HNUM = 'B');
0022.00          DNUM = 11;
0023.00        WHEN(HNUM = 'C');
0024.00          DNUM = 12;
0025.00        WHEN(HNUM = 'D');
0026.00          DNUM = 13;
0027.00        WHEN(HNUM = 'E');
0028.00          DNUM = 14;
0029.00        WHEN(HNUM = 'F');
0030.00          DNUM = 15;
0031.00        OTHER;
0032.00          MONITOR;
0033.00            IF(%INT(HNUM) <= 9);
0034.00              DNUM = %INT(HNUM);
0035.00            ENDIF;
0036.00            ON-ERROR;
0037.00              DNUM = 0;
0038.00          ENDMON;
0039.00        ENDSL;
0040.00      ENDSR;
0041.00
0042.00      BEGSR CLRCVT;
0043.00        DNUM = 0;
0044.00        HNUM = '';
0045.00      ENDSR;
        *****************  End of data ****************************************