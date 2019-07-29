 Columns . . . :    6   76                                      BOLIB/QRPGLESRC
 SEU==> ____________________________________________________________     DSOFDS
 FMT ** ... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+.
        *************** Beginning of data *************************************
0001.00 H
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
0002.00 D student         DS                  qualified
0003.00 D   firstName                   20A
0004.00 D   lastName                    20A
0005.00 D   contactInfo                       likeDS(contact_T)
0006.00 D   department                   3A
0007.00  *
0008.00 D contact_T       DS                  qualified template
0009.00 D   mobilePhone                 10S 0
0010.00 D   workPhone                   10S 0
0011.00 D   email                             likeDS(email_T)
0012.00  *
0013.00 D email_T         DS                  qualified template
0014.00 D   personal                    50A
0015.00 D   work                        50A
0016.00  *
0017.00  /free
0018.00   student.firstName = 'Barrett';
0019.00   student.lastName = 'Otte';
0020.00   student.contactInfo.mobilePhone = 1234567890;
0021.00   student.contactInfo.workPhone = 1234567890;
0022.00   student.contactInfo.email.personal = 'barrettotte@gmail.com';
0023.00   student.contactInfo.email.work = student.contactInfo.email.personal;
0024.00   student.department = 'CS';
0025.00   *INLR = *ON;
0026.00  /end-free
        ****************** End of data ****************************************