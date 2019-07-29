       /free

       dcl-pr qcmdexc extpgm('QCMDEXC');
         theCmd char(3000) const;
         cmdLne packed(15 : 5) const;
         dbcs char(3) const options(*nopass);
       end-pr;

       dcl-s cmd varchar(100);

       cmd = 'DSPJOB OUTPUT(*PRINT)';
       qcmdexc (cmd : %len(cmd));
       qcmdexc ('WRKSPLF' : 7);

       return;