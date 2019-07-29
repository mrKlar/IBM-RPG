       /free

       //RPG Arrays can only be 1 dimension
       //ISO format (yyyy-mm-dd)

       dcl-s dates date(*iso) dim(3);

       dates(1) = %date();                 //current date
       dates(2) = dates(1) + %days(1);     //tomorrow
       dates(3) = dates(1) + %years(1);    //next year
       dsply (%char(dates(1)) + ' '
            + %char(dates(2)) + ' '
            + %char(dates(3)));
       return;