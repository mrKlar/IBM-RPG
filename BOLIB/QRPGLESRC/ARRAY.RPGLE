 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________      ARRAY
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D arr             S              3S 0 Dim(10)
0003.00 D arrSub          S              3S 0 Dim(10)
0004.00 D i               S              2S 0
0005.00 D idx             S              2S 0
0006.00
0007.00  /free
0008.00
0009.00   for i=1 to 10;
0010.00     arr(i) = i;
0011.00   endfor;
0012.00
0013.00   for i=1 to %elem(arr);
0014.00     arr(i) = i;
0015.00     dsply arr(i);
0016.00   endfor;
0017.00
0018.00   idx = %lookup(8:arr);
0019.00   dsply idx;
0020.00
0021.00   idx = %lookup(3:arr:1);
0022.00   dsply idx;
0023.00
0024.00   idx = %lookup(4:arr:1:3); // 4 in arr start at 1, end at 3
0025.00   dsply idx
0026.00
0027.00   // To use these, arrays must be declared with ASCEND or DESCEND
0028.00   // %LOOKUPLT(arg: array {: start_index {: number of elements}})
0029.00   // %LOOKUPGT(arg: array {: start_index {: number of elements}})
0030.00   // %LOOKUPGE(arg: array {: start_index {: number of elements}})
0031.00   // %LOOKUPLE(arg: array {: start_index {: number of elements}})
0032.00
0033.00
0034.00   sorta arr; //sort by default direction (according to array declaration)
0035.00   // sortA(A) , sortA(D)
0036.00
0037.00   arrSub = %subarr(arr:4:4);  //sub array from i to 4 after i
0038.00
0039.00   dsply %xfoot(arr);   // sum of array
0040.00
0041.00   dsply %xfoot(arr + arrSub); //add two arrays (of same length)
0042.00
0043.00   
0044.00   *INLR = *ON;
0045.00  /end-free
        ****************** End of data ****************************************