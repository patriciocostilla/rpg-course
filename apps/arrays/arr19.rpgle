     Fpkpoke    it   f  158        disk
     D poke            s            158a   fromfile(pkpoke) dim(100)
     D i               s              2s 0
     D msg             s             52a

       for i = 1 to 7;
        msg = poke(i);
        dsply msg;
       endfor;

       *inlr = *on;
