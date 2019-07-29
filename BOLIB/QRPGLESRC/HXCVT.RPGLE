     FHXCVTDSP  CF   E             WORKSTN
      /FREE
        EXFMT RECORD1;
        DOW NOT(*IN03);
          EXSR GETNUM;
          WRITE RECORD1;
          EXFMT RECORD2;
          IF *IN03 = *OFF;
            EXSR CLRCVT;
            EXFMT RECORD1;
          ENDIF;
        ENDDO;
        *INLR = *ON;
        RETURN;

        BEGSR GETNUM;
          dnum = 0;
          SELECT;
            WHEN (HNUM = 'A');
              DNUM = 10;
            WHEN (HNUM = 'B');
              DNUM = 11;
            WHEN (HNUM = 'C');
              DNUM = 12;
            WHEN (HNUM = 'D');
              DNUM = 13;
            WHEN (HNUM = 'E');
              DNUM = 14;
            WHEN (HNUM = 'F');
              DNUM = 15;
            OTHER;
              MONITOR;
                IF (%INT(HNUM) <= 9);
                  DNUM = %INT(HNUM);
                ENDIF;
                ON-ERROR;
                  DNUM = 0;
              ENDMON;
          ENDSL;
        ENDSR;

        BEGSR CLRCVT;
          DNUM = 0;
          HNUM = '';
        ENDSR;