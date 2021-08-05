     Fpfcars1   if   e           k disk
     Fpf24      o    e             printer oflind(*in81)

     D rcastat         s             25a
     D rcacity         s             25a

       // Inicializar totalizadores
       prctot = 0;
       prstot = 0;
       prtot = 0;

       // Leer el archivo
       read pfcars1;

       // Inicializar resguardos
       rcastat = castat;
       rcacity = cacity;

       // Imprimir titulo
       exsr srTitle;

       // Iterar sobre el archivo
       dow not %eof(pfcars1);
        // Controlar corte
        exsr srCorte;

        // Controlar salto de pagina
        if *in81;
         exsr srTitle;
         *in81 = *off;
        endif;

        //Tratar registro actual
        prcastat = castat;
        prcacity = cacity;
        prcabran = cabran;
        prcamode = camode;
        prcapnum = capnum;
        prcadebt = cadebt;
        prctot = prctot + cadebt;
        write detail;

        // Leer el siguiente registro
        read pfcars1;
       enddo;

       // Ejecutar corte de mayor nivel
       exsr srCorteS;

       // Emitir totales
       write spacer;
       write tot;
       write spacer;

       // Finalizar programa
       *inlr = *on;

       // Subrutinas
       begsr srTitle;
        write title;
        write spacer;
        write headers;
        write spacer;
       endsr;
       
       begsr srCorte;
        if rcastat <> castat;
         exsr srCorteS;
         write spacer;
        elseif rcacity <> cacity;
         exsr srCorteC;
         write spacer;
        endif;
       endsr;

       begsr srCorteS;
        // Ejecutar corte de nivel inferior
        exsr srCorteC;

        // Escribir totales
        write spacer;
        write stot;

        // Acumular totales de nivel superior
        prtot = prtot + prstot;

        // Reiniciar totales de nivel actual
        prstot = 0;

        // Actualizar el resguardo
        rcastat = castat;
       endsr;

       begsr srCorteC;
        // Escribir totales
        write spacer;
        write ctot;

        // Acumular totales de nivel superior
        prstot = prstot + prctot;

        // Reiniciar totales de nivel actual
        prctot = 0;

        // Actualizar el resguardo
        rcacity = cacity;
       endsr;
