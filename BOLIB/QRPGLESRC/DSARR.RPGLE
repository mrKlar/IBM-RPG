 MEMBER  . . . . . . . . . DSARR
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data ************************************* 
0001.00   /free
0002.00
0003.00   dcl-ds person qualified;
0004.00     name varchar(25);
0005.00     age packed(5);
0006.00   end-ds;
0007.00
0008.00   dcl-ds families qualified dim(5);
0009.00     address varchar(50);
0010.00     numPeople uns(3);
0011.00     people likeds(person) dim(8);
0012.00   end-ds;
0013.00  
0014.00   dcl-s numFamilies uns(5) inz(0);
0015.00   dcl-s i int(10);
0016.00   dcl-s j int(10);
0017.00
0018.00   families(1).address = '1234 Street Road';
0019.00   families(1).people(1).name = 'Barrett';
0020.00   families(1).people(1).age = 22;
0021.00   families(1).people(2).name = 'Someone';
0022.00   families(1).people(2).age = 100;
0023.00   families(1).numPeople = 2;
0024.00   numFamilies = 1;
0025.00
0026.00   for i = 1 to numFamilies;
0027.00     dsply (families(i).address);
0028.00     for j = 1 to families(i).numPeople;
0029.00       dsply (families(i).people(j).name
0030.00            + ' is '
0031.00            + %char(families(i).people(j).age)
0032.00            + ' year(s) old.');
0033.00     endfor;
0034.00   endfor;
0035.00
0036.00   return;
        *****************  End of data ****************************************