*&---------------------------------------------------------------------*
*& Report Z01_VIEW_1_ANZEIGEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_view_1_anzeigen.

*DATA gs_view TYPE zv01_1.
*
*SELECT * FROM zv01_1 INTO gs_view
*  WHERE fldate BETWEEN '20220101' AND '20221231'.
*  WRITE: / gs_view-carrid,
*           gs_view-langer_name,
*           gs_view-connid,
*           gs_view-cityfrom,
*           gs_view-cityto,
*           gs_view-fldate,
*           gs_view-planetype,
*           gs_view-seatsmax,
*           gs_view-seatsocc.
*
*
*ENDSELECT.

DATA go_alv TYPE REF TO cl_salv_table.
DATA go_functions TYPE REF TO cl_salv_functions.
DATA gs_daten TYPE zv01_1.
DATA gt_daten TYPE TABLE OF zv01_1.

SELECT-OPTIONS so_fld FOR gs_daten-fldate.
SELECT * FROM zv01_1 INTO TABLE gt_daten
  WHERE fldate IN so_fld.


CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table = go_alv
  CHANGING
    t_table      = gt_daten.

CALL METHOD go_alv->get_functions RECEIVING value = go_functions .
CALL METHOD go_functions->set_all.
CALL METHOD go_alv->display.
