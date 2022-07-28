*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZCARR01.........................................*
DATA:  BEGIN OF STATUS_ZCARR01                       .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCARR01                       .
CONTROLS: TCTRL_ZCARR01
            TYPE TABLEVIEW USING SCREEN '0100'.
*.........table declarations:.................................*
TABLES: *ZCARR01                       .
TABLES: ZCARR01                        .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
