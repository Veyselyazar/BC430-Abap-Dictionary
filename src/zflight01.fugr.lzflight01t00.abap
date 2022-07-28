*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZFLIGHT01.......................................*
DATA:  BEGIN OF STATUS_ZFLIGHT01                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZFLIGHT01                     .
CONTROLS: TCTRL_ZFLIGHT01
            TYPE TABLEVIEW USING SCREEN '0100'.
*.........table declarations:.................................*
TABLES: *ZFLIGHT01                     .
TABLES: ZFLIGHT01                      .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
