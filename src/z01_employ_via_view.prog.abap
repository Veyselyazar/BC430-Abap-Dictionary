*&---------------------------------------------------------------------*
*& Report Z01_EMPLOY_VIA_VIEW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_employ_via_view.

DATA gs_view TYPE zv_employ01_dbv.

gs_view-carrier = 'AA'.
gs_view-emp_num = 3.
gs_view-department = 'PILO'.
gs_view-first_name = 'Melanie'.
gs_view-last_name = 'Schwarz'.


INSERT zv_employ01_dbv FROM gs_view.
IF sy-subrc = 0.
  MESSAGE 'Erfolgreich eingefügt' TYPE 'I'.
ELSE.
  MESSAGE 'Personalnummer existierte bereits' TYPE 'I'.
ENDIF.
