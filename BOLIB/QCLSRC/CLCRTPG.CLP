 Columns . . . :    1   71                                         BOLIB/QCLSRC
 SEU==> ____________________________________________________________    CLCRTPG
 FMT **  ...+... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7
        *************** Beginning of data *************************************
0001.00 /* Create an MI Program using the QPRCRTPG API */
0002.00 /* Found in the IBM knowledge center 'compiling an MI program' */
0003.00
0004.00             PGM        PARM(&SRCMBR)
0005.00
0006.00             DCLF       FILE(MISRC)
0007.00             DCL        VAR(&SRCMBR) TYPE(*CHAR) LEN(10)
0008.00             DCL        VAR(&MIPGMSRC) TYPE(*CHAR) LEN(2000)
0009.00             DCL        VAR(&MIPGMSRCSZ) TYPE(*CHAR) LEN(4)
0010.00             DCL        VAR(&OFFSET) TYPE(*DEC) LEN(5 0) VALUE(1)
0011.00             DCL        VAR(&PGMNAM) TYPE(*CHAR) LEN(20) +
0012.00                            VALUE('          *CURLIB   ')
0013.00             DCL        VAR(&PGMTXT) TYPE(*CHAR) LEN(50) +
0014.00                            VALUE('Compare two packed arguments and +
0015.00                                   return larger')
0016.00             DCL        VAR(&PGMSRCF) TYPE(*CHAR) LEN(20) +
0017.00                           VALUE('*NONE')
0018.00             DCL        VAR(&PGMSRCM) TYPE(*CHAR) LEN(10) VALUE(' ')
0019.00             DCL        VAR(&PGMSRCCHG) TYPE(*CHAR) LEN(13) VALUE(' ')
0020.00             DCL        VAR(&PRTFNAM) TYPE(*CHAR) LEN(20) +
0021.00                            VALUE('QSYSPRT   *LIBL     ')
0022.00             DCL        VAR(&PRTSTRPAG) TYPE(*CHAR) LEN(4) +
0023.00                            VALUE(X'00000001')
0024.00             DCL        VAR(&PGMPUBAUT) TYPE(*CHAR) LEN(10) +
0025.00                            VALUE('*ALL      ')
0026.00             DCL        VAR(&PGMOPTS) TYPE(*CHAR) LEN(22) +
0027.00                            VALUE('*LIST      *REPLACE   ')
0028.00             DCL        VAR(&NUMOPTS) TYPE(*CHAR) LEN(4) +
0029.00                            VALUE(X'00000002')
0030.00 LOOP:       RCVF
0031.00             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(CRTPGM))
0032.00             CHGVAR     VAR(%SST(&MIPGMSRC &OFFSET 80)) VALUE(&SRCDTA)
0033.00             CHGVAR     VAR(&OFFSET) VALUE(&OFFSET + 80)
0034.00             GOTO       CMDLBL(LOOP)
0035.00 CRTPGM:     CHGVAR     VAR(%SST(&PGMNAM 1 10)) VALUE(&SRCMBR)
0036.00             CHGVAR     VAR(%BIN(&MIPGMSRCSZ)) VALUE(&OFFSET)
0037.00             CALL       PGM(QSYS/QPRCRTPG) PARM(&MIPGMSRC +
0038.00                            &MIPGMSRCSZ &PGMNAM &PGMTXT &PGMSRCF +
0039.00                            &PGMSRCM &PGMSRCCHG &PRTFNAM &PRTSTRPAG +
0040.00                            &PGMPUBAUT &PGMOPTS &NUMOPTS)
0041.00
0042.00              ENDPGM
        *****************  End of data ****************************************