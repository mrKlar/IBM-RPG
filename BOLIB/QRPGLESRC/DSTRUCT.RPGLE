       /free
       dcl-ds bankAcc qualified;
         name char(10) inz('Barrett');
         id packed(5) inz(1);
         balance packed(9 : 2) inz(185.50);
       end-ds;

       dcl-ds otherAcc likeds(bankAcc) inz(*likeds);

       dsply ('[' + %char(bankAcc.id) + '] '
            + bankAcc.name
            + ' has a balance of '
            + %char(bankAcc.balance));

       otherAcc.name = 'Joe';
       otherAcc.id = 1234;
       otherAcc.balance += 10000;
       dsply ('[' + %char(otherAcc.id) + '] '
            + otherAcc.name
            + ' has a balance of '
            + %char(otherAcc.balance));

       return;