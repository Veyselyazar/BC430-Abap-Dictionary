*&---------------------------------------------------------------------*
*& Report Z01_SBOOK_PERFORMANCE_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_sbook_customid_index.

DATA go_alv TYPE REF TO cl_salv_table.
PARAMETERS pa_cust TYPE scustom-id.
GET RUN TIME FIELD DATA(gv_time).

DATA gt_sbook TYPE TABLE OF sbook.
SELECT *  FROM zsbook_col INTO TABLE  gt_sbook BYPASSING BUFFER
  WHERE customid = pa_cust.

GET RUN TIME FIELD gv_time.


CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table = go_alv
  CHANGING
    t_table      = gt_sbook.

go_alv->display( ).
WRITE: 'Vergangene zeit für Select', gv_time.
