     H* Control Specification
     H dftactgrp(*no) option(*nodebugio) datfmt(*iso) main(mainp)

     F* Files
     Fcshero    if a e           k disk

     D* Procedure Interface
     D mainp           pr                  extpgm('PR13')
     D                               30a
     D                               30a
     D                                 d

     D* Prototypes
     D writeCshero     pr
     D                               30a
     D                               30a
     D                                 d
     D valName         pr              n
     D                               30a
     D valSecr         pr              n
     D                               30a
     D getNewId        pr             4s 0

     D* PSDS
     D sysds          sds
     D  pgm                    1     10a
     D  user                 254    263a

     D* Variables
     D nameValid       s               n
     D secrValid       s               n

     C* Program Entry Point
     P mainp           b
     D                 pi
     D name                          30a
     D secr                          30a
     D bday                            d
       // Validate input
       nameValid = valName(name);
       secrValid = valSecr(secr);

       // If input is valid try to write to table
       if nameValid and secrValid;
        writeCshero(name: secr: bday);
       else;
        dsply 'Input data not valid';
       endif;

       close cshero;
       *inlr = *on;
       return;
     P mainp           e

     P* Subprocedures and functions
     P writeCshero     b
     D                 pi
     D zName                         30a
     D zSecr                         30a
     D zBday                           d
     D newId           s              4s 0
       newId = getNewId();
       if newId = -1;
        dsply 'The table is full';
        return;
       endif;
       shid = newId;
       shname = zName;
       shsecr = zSecr;
       shbday = zBday;
       shpgm = pgm;
       shuser = user;
       shdate = %timestamp();
       write csheror;
     P writeCshero     e
     P valName         b
     D                 pi              n
     D zName                         30a
       if zName <> *blanks;
        return *on;
       else;
        return *off;
       endif;
     P valName         e
     P valSecr         b
     D                 pi              n
     D zSecr                         30a
       if zSecr <> *blanks;
        return *on;
       else;
        return *off;
       endif;
     P valSecr         e
     P getNewId        b
     D                 pi             4s 0
       setll *hival cshero;
       readp cshero;
       if shid = 9999;
        return -1;
       else;
        return shid + 1;
       endif;
     P getNewId        e
