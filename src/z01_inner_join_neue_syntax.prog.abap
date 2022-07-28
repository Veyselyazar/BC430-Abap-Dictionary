*&---------------------------------------------------------------------*
*& Report Z01_VIEW_1_ANZEIGEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_inner_join_neue_syntax.


DATA go_alv TYPE REF TO cl_salv_table.
DATA go_functions TYPE REF TO cl_salv_functions.
"DATA gs_daten TYPE zv01_1.
"DATA gt_daten TYPE TABLE OF zv01_1.

*TYPES: BEGIN OF ts_daten,
*         carrid   TYPE scarr-carrid,
*         connid   TYPE spfli-connid,
*         carrname TYPE scarr-carrname,
*         cityfrom TYPE spfli-cityfrom,
*         cityto   TYPE spfli-cityto,
*         fldate   type sflight-fldate,
*         seatsmax type sflight-seatsmax,
*         seatsocc type sflight-seatsocc,
*       END OF ts_daten.

*DATA gt_daten TYPE TABLE OF ts_daten.
*data gs_daten type ts_daten.
DATA gv_fldate TYPE sflight-fldate.
SELECT-OPTIONS so_fld FOR gv_fldate.


SELECT a~carrid, b~connid, carrname,
  cityfrom, cityto, fldate, planetype, seatsmax, seatsocc
  FROM scarr as a inner join spfli as b
   ON a~carrid = b~carrid
   INNER JOIN sflight as termin
   ON  b~carrid = termin~carrid
   AND b~connid = termin~connid

  INTO TABLE @DATA(gt_daten)
  WHERE fldate IN @so_fld.
   " AND countryfr = b~countryto.



CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table = go_alv
  CHANGING
    t_table      = gt_daten.

CALL METHOD go_alv->get_functions RECEIVING value = go_functions .
CALL METHOD go_functions->set_all.
CALL METHOD go_alv->display.
