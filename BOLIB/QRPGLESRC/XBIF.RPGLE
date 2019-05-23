 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________       XBIF
 FMT C  CL0N01Factor1+++++++Opcode&ExtFactor2+++++++Result++++++++Len++D+HiLoEq
        *************** Beginning of data *************************************
0001.00 DA            S            12    INZ('   Toronto,')
0002.00 DB            S            30    INZ(' Ontario, Canada ')
0003.00 DRES1         S            20    
0004.00 DRES2         S             4S 0
0005.00 DRES3         S            21
0006.00 DLEFT         S             4
0007.00 
0008.00 
0009.00 C             EVAL  RES1=%TRIM(A+SUBST(B:11:%SIZE(B)-20))
0010.00 C             EVAL  RES2=%SIZE(B)
0011.00 C             EVAL  RES3=%SUBST(B:11:%SIZE(B)-20)
0012.00 C    'RES1='  DSPLY                   RES1
0013.00 C    'RES2='  DSPLY                   RES2
0014.00 C    'RES3='  DSPLY                   RES3
0015.00 C             MOVEL     'LEFT'        LEFT
0016.00 C    'LEFT='  DSPLY                   LEFT
0017.00 C             SETON                                              LR
        ****************** End of data ****************************************