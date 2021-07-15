     D* Variables
     D len             c                   const(10000)
     D users         e ds                  extname(twuser) qualified dim(len)
     D  usid         e                     inz(0)
     D i               s              5s 0
     C* Program entry point
       exec sql declare c1 cursor for
            select *
            from twuser
            limit :len;
       exec sql open c1;
       exec sql fetch c1 for :len rows into :users;
       exec sql close c1;
       sorta users(*).usid;
       for i = 1 to len;
        dsply users(i).usname;
       endfor;
       *inlr = *on;
