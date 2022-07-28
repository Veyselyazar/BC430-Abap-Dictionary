*&---------------------------------------------------------------------*
*& Report Y_TABELLENYT_IN_STRUKTUR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT y_tabellenyt_in_struktur.

DATA gs_person TYPE yperson01.
DATA gs_kind LIKE LINE OF gs_person-it_kinder.

gs_person-vorname = 'Wolfgang'.
gs_person-nachname = 'Köller'.


gs_kind-vorname = 'Marlon'.
gs_kind-nachname = 'Köller'.
gs_kind-geb_dat = '19890313'.

INSERT gs_kind INTO TABLE gs_person-it_kinder.

clear gs_kind.

write: gs_person-vorname, gs_person-nachname.

loop at gs_person-it_kinder into gs_kind.
  write: /15 gs_kind-vorname.

ENDLOOP.
