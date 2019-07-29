 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________    STUD01R
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT F  FFilename++IPEASFRlen+LKlen+AIDevice+.Keywords+++++++++++++++++++++++++
0002.00 Fstudpf    IF   E           K DISK
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0003.00 D key             S                   like(SID)
0004.00  *
0005.00  /free
0006.00   read studpf;
0007.00   dsply sname; // 'Barrett'
0008.00   readp studpf;
0009.00   dsply sname; // 'Barrett'
0010.00   read studpf;
0011.00   dsply sname; // 'Joe'
0012.00
0013.00   key = 5;
0014.00   setll key studpf; //setll-before 5, setgt-after 5
0015.00   reade key studpf;
0016.00   dsply sname; // 'Hello'
0017.00
0018.00   chain key studpf;   //combines setll and reade
0019.00   if %found(studpf);
0020.00     dsply sname;
0021.00   else;
0022.00     dsply 'Not found';
0023.00   endif;
0024.00
0025.00   dow not %eof(studpf);
0026.00     read studpf;
0027.00     dsply sname;
0028.00   enddo;
0029.00
0030.00   *INLR = *ON;
0031.00  /end-free
        ****************** End of data ****************************************