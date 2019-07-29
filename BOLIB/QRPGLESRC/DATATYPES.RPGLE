      H
      D num1            S              5S 0
      D num2            S              5P 0
      D num3            S              5S 2
      D num4            S              5P 3
      D date1           S               D
      D time1           S               T
      D timestamp       S               Z
      D flag            S              1N
      D PI              C                    3.14
      D name            S             20A
       *
       /free
       Eval num3 = 10/3;       // Eval(H) -> round up
       num4 = 10/3;
       num2 = 10**2;
       num1 = %Rem(14:5);
       Dsply num3;             // 333
       Dsply num4;             // 3333
       Dsply %Char(num3);      // 3.33
       Dsply %Char(num4);      // 3.333
       Dsply num2;             // 100
       Dsply num1;             //

       date1 = %Date();
       time1 = %Time();
       timestamp = %Timestamp();
       Dsply date1;
       Dsply time1;
       Dsply timestamp;

       flag = *ON;             // *OFF

       *INLR = *ON;
       /end-free