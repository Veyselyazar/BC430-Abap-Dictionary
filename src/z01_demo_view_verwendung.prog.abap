*&---------------------------------------------------------------------*
*& Report Z01_DEMO_VIEW_VERWENDUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_DEMO_VIEW_VERWENDUNG.

data gs_view type z01_demo_view.

select * from z01_demo_view
  into gs_view.


ENDSELECT.
