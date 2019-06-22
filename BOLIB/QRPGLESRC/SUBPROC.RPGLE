 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________    SUBPROC
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H DftActGrp(*no)
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D A               S              3S 0
0003.00 D B               S              3S 0
0004.00 D C               S              4S 0
0005.00  *
0006.00 D addProc         PR             4S 0
0007.00 D                                3S 0 const
0008.00 D                                3S 0 const
0007.00  *
0008.00  /free
0009.00    dsply 'Enter A:' '' A;
0010.00    dsply 'Enter B:' '' B;
0011.00    C = addProc(A:B);
0012.00    dsply C;
0013.00    *INLR = *ON;
0014.00  /end-free
0016.00  *
0017.00 P addProc         B
0018.00 D addProc         PR
0019.00 D                 PI             4S 0 
0020.00 D num1                           3S 0 const
0021.00 D num2                           3S 0 const
0022.00 D sum             S              4S 0
0023.00 D
0024.00  /free
0025.00    sum = num1 + num2;
0026.00    return sum;
0027.00  /end-free
0028.00 P addProc         E
        ****************** End of data ****************************************