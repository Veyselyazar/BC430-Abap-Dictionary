*&---------------------------------------------------------------------*
*& Report Z01_TYPGRUPPE_VERWENDEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_typgruppe_verwenden.

TYPE-POOLS: abap.
WRITE abap_true.

WRITE / zcl_bc430_00=>pi.

data gs_name type zwko_komplex.

BREAK-POINT.
