      D arr             S              3S 0 Dim(10)
      D i               S              2S 0

       /free
       for i=1 to 10;
         arr(i) = i;
       endfor;

       for i=1 to %elem(arr);
         arr(i) = i;
         dsply arr(i);
       endfor;

       idx = %lookup(8:arr);
       dsply idx;
       *INLR = *ON;
       /end-free
