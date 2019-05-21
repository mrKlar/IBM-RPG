 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________    PGMCALL
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data ************************************* 
0001.00  /free
0002.00   
0003.00   dcl-pr qcmdexc extpgm('QCMDEXC');
0004.00     theCmd char(3000) const;
0005.00     cmdLne packed(15 : 5) const;
0006.00     dbcs char(3) const options(*nopass);
0007.00   end-pr;
0008.00
0009.00   dcl-s cmd varchar(100);
0010.00
0011.00   cmd = 'DSPJOB OUTPUT(*PRINT)';
0012.00   qcmdexc (cmd : %len(cmd));
0013.00   qcmdexc ('WRKSPLF' : 7);
0014.00
0015.00   return;
        *****************  End of data ****************************************