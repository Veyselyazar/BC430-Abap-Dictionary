*&---------------------------------------------------------------------*
*& Report ZPROG1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPROG1.

data go_alv type REF TO cl_salv_table.
data go_lv_2 type z_de_demo.

PARAMETERS pa_car type spfli-carrid MEMORY ID car.
PARAMETERS pa_kdn type kna1-kunnr.
