 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________    CHAINMK
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT F  FFilename++IPEASFRlen+LKlen+AIDevice+.Keywords+++++++++++++++++++++++++
0002.00 ForderPF   IF   E           K disk
0003.00  *
 FMT C  CL0N01Factor1+++++++Opcode&ExtFactor2+++++++Result++++++++Len++D+HiLoEq
0005.00 C     key1          Klist
0006.00 C                   Kfld                   ordItm
0007.00 C                   Kfld                   ordDate
0008.00  *
0007.00  /free
0008.00   ordItm = 1111;
0009.00   ordDate = %date('2019-06-22');
0010.00
0011.00   //chain(ordItm:ordDate) orderPF;
0012.00   chain key1 orderPF;
0013.00   if %found(orderPF);
0014.00     dsply (%char(ordItm) + ' ' + ordItmDes + %char(ordDate));
0015.00   endif;
0016.00   
0017.00   *INLR = *ON;
0018.00  /end-free
        ****************** End of data ****************************************