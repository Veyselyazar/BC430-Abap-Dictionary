*&---------------------------------------------------------------------*
*& Report Z01_ANZEIGE_SPFLI_IM_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_ANZEIGE_SPFLI_IM_ALV.


PARAMETERS pa_prog type c LENGTH 30 MEMORY ID rid.

"data gt_spfli type standard table of spfli WITH NON-UNIQUE DEFAULT KEY.
data gt_spfli type standard table of spfli
      with non-UNIQUE key cityfrom cityto.
data go_alv type z_de_demo.
select * from spfli into TABLE gt_spfli.
select * from spfli appending TABLE gt_spfli.

BREAK-POINT.


CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table   = go_alv
  CHANGING
    t_table        = gt_spfli
    .

call method go_alv->display.
