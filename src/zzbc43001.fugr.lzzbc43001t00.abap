*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZPARTNER01......................................*
TABLES: ZPARTNER01, *ZPARTNER01. "view work areas
CONTROLS: TCTRL_ZPARTNER01
TYPE TABLEVIEW USING SCREEN '0100'.
DATA: BEGIN OF STATUS_ZPARTNER01. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZPARTNER01.
* Table for entries selected to show on screen
DATA: BEGIN OF ZPARTNER01_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZPARTNER01.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZPARTNER01_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZPARTNER01_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZPARTNER01.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZPARTNER01_TOTAL.

*.........table declarations:.................................*
TABLES: SBUSPART                       .
TABLES: STRAVELAG                      .
