*&---------------------------------------------------------------------*
*& Report ZBC430_01_LOKALE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbc430_01_lokale_datentypen.

types: tt_string type STANDARD TABLE OF s_carr_id
       with non-UNIQUE key table_line.

data gt_string type tt_string.

append 'Müller' to gt_string.
append 'Maier' to gt_string.
append 'Hoffmann' to gt_string.


TYPES: BEGIN OF ts_name,
         vorname  TYPE c LENGTH 20,
         nachname TYPE c LENGTH 20,
       END OF ts_name.

TYPES: BEGIN OF ts_ort,
         plz TYPE z98_plz,
         ort TYPE c LENGTH 50,
       END OF ts_ort.

TYPES: BEGIN OF ts_telefon,
         t_typ TYPE c LENGTH 10,
         t_nr  TYPE c LENGTH 20,
       END OF ts_telefon.

TYPES  tt_telefon TYPE standard TABLE OF ts_telefon
       with NON-UNIQUE DEFAULT KEY.

TYPES: BEGIN OF ts_person,
         pers_nr  TYPE i,
         name     TYPE ts_name,
         ort  TYPE ts_ort,
         it_telefon type tt_telefon,
       END OF ts_person.


data gs_telefon type ts_telefon.
DATA gs_person TYPE ts_person.
data gt_personen type TABLE OF ts_person.
gs_telefon-t_typ = 'Mobil'.
gs_telefon-t_nr = '01575 435435'.

insert gs_telefon into table gs_person-it_telefon.

gs_telefon-t_typ = 'Festnetz'.
gs_telefon-t_nr = '040 4353455'.

insert gs_telefon into table gs_person-it_telefon.

gs_person-pers_nr = 1.
gs_person-ort-plz = 52351.
gs_person-ort-ort = 'Düren'.
gs_person-name-vorname = 'Stefanie'.
gs_person-name-nachname = 'Langner'.

insert gs_person into table gt_personen.
insert gs_person into table gt_personen.
insert gs_person into table gt_personen.



"WRITE gs_person. "Zeichenartig: C, N, D, T
WRITE / gs_person-ort-plz. "Aus Zeichenartigem Anfangsbereich
