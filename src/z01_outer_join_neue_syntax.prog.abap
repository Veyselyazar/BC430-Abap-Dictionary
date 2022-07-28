*&---------------------------------------------------------------------*
*& Report Z01_VIEW_1_ANZEIGEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_outer_join_neue_syntax.


DATA go_alv TYPE REF TO cl_salv_table.
DATA go_functions TYPE REF TO cl_salv_functions.

SELECT b~carrid, b~connid, carrname,
  cityfrom, cityto
  FROM spfli as b left outer join scarr as a
   ON a~carrid = b~carrid

  INTO TABLE @DATA(gt_daten).

   " AND countryfr = b~countryto.



CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table = go_alv
  CHANGING
    t_table      = gt_daten.

CALL METHOD go_alv->get_functions RECEIVING value = go_functions .
CALL METHOD go_functions->set_all.
CALL METHOD go_alv->display.
