 Columns . . . :    1   71                                         BOLIB/QCLSRC
 SEU==> ____________________________________________________________   TESTMI01
 FMT **  ...+... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7
        *************** Beginning of data *************************************
0001.00 PGM        PARM(&ARG1 &ARG2)
0002.00
0003.00 DCL        VAR(&ARG1) TYPE(*DEC) LEN(15 5)
0004.00 DCL        VAR(&ARG2) TYPE(*DEC) LEN(15 5)
0005.00 DCL        VAR(&RESULT) TYPE(*DEC) LEN(15 5)
0006.00 DCL        VAR(&MSG) TYPE(*CHAR) LEN(20)
0007.00 DCL        VAR(&USR) TYPE(*CHAR) LEN(10)
0008.00 RTVJOBA    USER(&USR)
0009.00 CALL       PGM(MI01) PARM(&ARG1 &ARG2 &RESULT)
0010.00 CHGVAR     VAR(&MSG) VALUE(&RESULT)
0011.00 SNDMSG     MSG(&MSG) TOUSR(&USR)
0012.00
0013.00 ENDPGM
        *****************  End of data ****************************************