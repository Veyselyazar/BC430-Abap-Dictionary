*&---------------------------------------------------------------------*
*& Report Z01_VIEW_1_ANZEIGEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_inner_jon_anzeigen.


DATA go_alv TYPE REF TO cl_salv_table.
DATA go_functions TYPE REF TO cl_salv_functions.
"DATA gs_daten TYPE zv01_1.
"DATA gt_daten TYPE TABLE OF zv01_1.

TYPES: BEGIN OF ts_daten,
         carrid   TYPE scarr-carrid,
         connid   TYPE spfli-connid,
         carrname TYPE scarr-carrname,
         cityfrom TYPE spfli-cityfrom,
         cityto   TYPE spfli-cityto,
         fldate   type sflight-fldate,
         seatsmax type sflight-seatsmax,
         seatsocc type sflight-seatsocc,
       END OF ts_daten.

DATA gt_daten TYPE TABLE OF ts_daten.
data gs_daten type ts_daten.
SELECT-OPTIONS so_fld for gs_daten-fldate.


SELECT spfli~carrid spfli~connid carrname cityfrom cityto fldate seatsmax seatsocc
  FROM scarr INNER JOIN spfli
   ON scarr~carrid = spfli~carrid
   INNER JOIN sflight
   on  spfli~carrid = sflight~carrid
   and spfli~connid = sflight~connid

  INTO TABLE gt_daten
  where fldate in so_fld
    and countryfr = spfli~countryto.



CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table = go_alv
  CHANGING
    t_table      = gt_daten.

CALL METHOD go_alv->get_functions RECEIVING value = go_functions .
CALL METHOD go_functions->set_all.
CALL METHOD go_alv->display.
