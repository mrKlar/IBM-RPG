 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________    DSTRUCT 
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00  /free
0002.00   dcl-ds bankAcc qualified;
0003.00     name char(10) inz('Barrett');
0004.00     id packed(5) inz(1);
0005.00     balance packed(9 : 2) inz(185.50);
0006.00   end-ds;
0007.00
0008.00   dcl-ds otherAcc likeds(bankAcc) inz(*likeds);
0009.00
0010.00   dsply ('[' + %char(bankAcc.id) + '] '
0011.00        + bankAcc.name
0012.00        + ' has a balance of '
0013.00        + %char(bankAcc.balance));
0014.00
0015.00   otherAcc.name = 'Joe';
0016.00   otherAcc.id = 1234;
0017.00   otherAcc.balance += 10000;
0018.00   dsply ('[' + %char(otherAcc.id) + '] '
0019.00        + otherAcc.name
0020.00        + ' has a balance of '
0021.00        + %char(otherAcc.balance));
0022.00
0023.00   return;
        *****************  End of data ****************************************