     Fdtdate    o    e             disk
     D date            s               d   inz(d'0001-01-01')

       dow date < d'9999-12-31';
        pdate = %dec(date: *iso);
        if date = d'0300-02-28';
         date = d'0300-03-02';
         pdate = 03000228;
         ndate = 03000301;
         write dtdater;
         iter;
        else;
         date = date + %days(1);
        endif;
        ndate = %dec(date: *iso);
        write dtdater;
       enddo;
       *inlr = *on;
