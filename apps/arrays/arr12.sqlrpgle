     D sep             c                   const('---------')
     D len             c                   const(5)
     D emps            ds                  occurs(len) qualified
     D  name                         10a   inz('')
     D  salary                        4s 0 inz(0)
     D num             s              4s 0
     D res             s              5s 0
     D i               s              2s 0

       dsply sep;

       for i = 1 to len;
        %occur(emps) = i;
        exec sql select int(1000 * rand()) into :num from sysibm.sysdummy1;
        emps.salary = num;
        emps.name = 'Employee ' + %char(i);
        dsply (emps.name + '-' + %char(emps.salary));
       endfor;

       *inlr = *on;
