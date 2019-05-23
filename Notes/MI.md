# Machine Interface (MI)


Machine interface seems like a weird mix of CL and Assembly programming


## Creating an MI program and compiling/testing with CLP (IBM knowledge center example)
* Create source physical file **QMISRC**
* Create new source member of type **MI** in **QMISRC**
* Create CL program to compile MI progam (BOLIB/QCLSRC/CLCRTPG.CLP)
* Call CL compile program
  * ```DLTOVR QMISRC```
  * ```OVRDBF QMISRC MBR(MI01)```
  * ```CALL CLCRTPG MI01```
* Create CL program to test MI program (BOLIB/QCLSRC/TESTMI01.CLP)
* Compile CL test program
* ```CALL TESTMI01 (-5 6)```


## Sources
* Main https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_72/rzatk/mitoc.htm
* Instructions https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/rzatk/inst.htm


## To Do : Make an enhanced MI compilation program in MI
* https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/rzatk/MIcrever.htm