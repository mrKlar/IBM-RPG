/* Create an MI Program using the QPRCRTPG API */
/* Found in the IBM knowledge center 'compiling an MI program' */

            PGM        PARM(&SRCMBR)

            DCLF       FILE(MISRC)
            DCL        VAR(&SRCMBR) TYPE(*CHAR) LEN(10)
            DCL        VAR(&MIPGMSRC) TYPE(*CHAR) LEN(2000)
            DCL        VAR(&MIPGMSRCSZ) TYPE(*CHAR) LEN(4)
            DCL        VAR(&OFFSET) TYPE(*DEC) LEN(5 0) VALUE(1)
            DCL        VAR(&PGMNAM) TYPE(*CHAR) LEN(20) +
                           VALUE('          *CURLIB   ')
            DCL        VAR(&PGMTXT) TYPE(*CHAR) LEN(50) +
                           VALUE('Compare two packed arguments and +
                                  return larger')
            DCL        VAR(&PGMSRCF) TYPE(*CHAR) LEN(20) +
                          VALUE('*NONE')
            DCL        VAR(&PGMSRCM) TYPE(*CHAR) LEN(10) VALUE(' ')
            DCL        VAR(&PGMSRCCHG) TYPE(*CHAR) LEN(13) VALUE(' ')
            DCL        VAR(&PRTFNAM) TYPE(*CHAR) LEN(20) +
                           VALUE('QSYSPRT   *LIBL     ')
            DCL        VAR(&PRTSTRPAG) TYPE(*CHAR) LEN(4) +
                           VALUE(X'00000001')
            DCL        VAR(&PGMPUBAUT) TYPE(*CHAR) LEN(10) +
                           VALUE('*ALL      ')
            DCL        VAR(&PGMOPTS) TYPE(*CHAR) LEN(22) +
                           VALUE('*LIST      *REPLACE   ')
            DCL        VAR(&NUMOPTS) TYPE(*CHAR) LEN(4) +
                           VALUE(X'00000002')
LOOP:       RCVF
            MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(CRTPGM))
            CHGVAR     VAR(%SST(&MIPGMSRC &OFFSET 80)) VALUE(&SRCDTA)
            CHGVAR     VAR(&OFFSET) VALUE(&OFFSET + 80)
            GOTO       CMDLBL(LOOP)
CRTPGM:     CHGVAR     VAR(%SST(&PGMNAM 1 10)) VALUE(&SRCMBR)
            CHGVAR     VAR(%BIN(&MIPGMSRCSZ)) VALUE(&OFFSET)
            CALL       PGM(QSYS/QPRCRTPG) PARM(&MIPGMSRC +
                           &MIPGMSRCSZ &PGMNAM &PGMTXT &PGMSRCF +
                           &PGMSRCM &PGMSRCCHG &PRTFNAM &PRTSTRPAG +
                           &PGMPUBAUT &PGMOPTS &NUMOPTS)

             ENDPGM