       /free

       dcl-ds person qualified;
         name varchar(25);
         age packed(5);
       end-ds;

       dcl-ds families qualified dim(5);
         address varchar(50);
         numPeople uns(3);
         people likeds(person) dim(8);
       end-ds;

       dcl-s numFamilies uns(5) inz(0);
       dcl-s i int(10);
       dcl-s j int(10);

       families(1).address = '1234 Street Road';
       families(1).people(1).name = 'Barrett';
       families(1).people(1).age = 22;
       families(1).people(2).name = 'Someone';
       families(1).people(2).age = 100;
       families(1).numPeople = 2;
       numFamilies = 1;

       for i = 1 to numFamilies;
         dsply (families(i).address);
         for j = 1 to families(i).numPeople;
           dsply (families(i).people(j).name
                + ' is '
                + %char(families(i).people(j).age)
                + ' year(s) old.');
         endfor;
       endfor;

       return;