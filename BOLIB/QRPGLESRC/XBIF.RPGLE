      DA            S            12    INZ('   Toronto,')
      DB            S            30    INZ(' Ontario, Canada ')
      DRES1         S            20    
      DRES2         S             4S 0
      DRES3         S            21
      DLEFT         S             4


      C             EVAL  RES1=%TRIM(A+SUBST(B:11:%SIZE(B)-20))
      C             EVAL  RES2=%SIZE(B)
      C             EVAL  RES3=%SUBST(B:11:%SIZE(B)-20)
      C    'RES1='  DSPLY                   RES1
      C    'RES2='  DSPLY                   RES2
      C    'RES3='  DSPLY                   RES3
      C             MOVEL     'LEFT'        LEFT
      C    'LEFT='  DSPLY                   LEFT
      C             SETON                                              LR