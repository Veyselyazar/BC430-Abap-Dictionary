*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZPFLI01.........................................*
DATA:  BEGIN OF STATUS_ZPFLI01                       .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZPFLI01                       .
CONTROLS: TCTRL_ZPFLI01
            TYPE TABLEVIEW USING SCREEN '0100'.
*.........table declarations:.................................*
TABLES: *ZPFLI01                       .
TABLES: ZPFLI01                        .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
