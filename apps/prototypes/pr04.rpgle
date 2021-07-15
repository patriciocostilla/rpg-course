     H dftactgrp(*no)
     D* Prototypes
     D square          pr             8s 0
     D                                4s 0
     D*
     D* Variables
     D num             s              4s 0
     D res             s              8s 0
     C* Program entry point
       num = 5;
       res = square(num);
       dsply res;
       *inlr = *on;

     P* Subprocedures
     Psquare           b
     D                 pi             8s 0
     D input                          4s 0
       return input ** 2;
     P                 e
