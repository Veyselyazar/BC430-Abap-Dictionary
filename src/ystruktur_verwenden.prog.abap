*&---------------------------------------------------------------------*
*& Report YSTRUKTUR_VERWENDEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YSTRUKTUR_VERWENDEN.

PARAMETERS pa_vn type yname01-vorname.
PARAMETERS pa_nn type yname01-nachname.
PARAMETERS pa_vn2 type yperson01-vorname.

data gt_namen type yty_name.
data gs_namen like line of gt_namen.
gs_namen-vorname = 'Werner'.
insert gs_namen into TABLE gt_namen.
gs_namen-vorname = 'Stefanie'.
insert gs_namen into TABLE gt_namen.

"sort gt_namen by nachname DESCENDING vorname ASCENDING.



data gs_name type yname01.
data gs_person type yperson01.


gs_person-nachname = 'Werner'.
gs_person-mutter-nachname = 'Müller'.

*gs_person-carrid = 'AA'.
*gs_person-scarr-carrid = 'LH'.


BREAK-POINT.
