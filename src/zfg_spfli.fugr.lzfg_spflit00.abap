*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZPV_SPFLI.......................................*
TABLES: ZPV_SPFLI, *ZPV_SPFLI. "view work areas
CONTROLS: TCTRL_ZPV_SPFLI
TYPE TABLEVIEW USING SCREEN '0100'.
DATA: BEGIN OF STATUS_ZPV_SPFLI. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZPV_SPFLI.
* Table for entries selected to show on screen
DATA: BEGIN OF ZPV_SPFLI_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZPV_SPFLI.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZPV_SPFLI_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZPV_SPFLI_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZPV_SPFLI.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZPV_SPFLI_TOTAL.

*.........table declarations:.................................*
TABLES: SCARR                          .
TABLES: SPFLI                          .
