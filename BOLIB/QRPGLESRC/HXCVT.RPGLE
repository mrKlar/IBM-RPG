 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________      HXCVT
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data ************************************* 
0001.00 FHXCVTDSP  CF   E             WORKSTN
0002.00  /free
0003.00    exfmt record1;
0004.00    dow not(*in03);
0005.00      exsr getnum;
0006.00      write record1;
0007.00      exfmt record2;
0008.00      if(*in03 = *off);
0009.00        exsr clrcvt;
0010.00        exfmt record1;
0011.00      endif;
0012.00    enddo;
0013.00    *inlr = *on;
0014.00    return;
0015.00
0016.00    begsr getnum;
0017.00      dnum = 0;
0018.00      select;
0019.00        when(hnum = 'a');
0020.00          dnum = 10;
0021.00        when(hnum = 'b');
0022.00          dnum = 11;
0023.00        when(hnum = 'c');
0024.00          dnum = 12;
0025.00        when(hnum = 'd');
0026.00          dnum = 13;
0027.00        when(hnum = 'e');
0028.00          dnum = 14;
0029.00        when(hnum = 'f');
0030.00          dnum = 15;
0031.00        other;
0032.00          monitor;
0033.00            if(%int(hnum) <= 9);
0034.00              dnum = %int(hnum);
0035.00            endif;
0036.00            on-error;
0037.00              dnum = 0;
0038.00          endmon;
0039.00        endsl;
0040.00      endsr;
0041.00
0042.00      begsr clrcvt;
0043.00        dnum = 0;
0044.00        hnum = '';
0045.00      endsr;
0046.00  /end-free
        *****************  End of data ****************************************