*&---------------------------------------------------------------------*
*& Report ZBC430_01_DTA_ELEMENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBC430_01_DATA_ELEMENTS.

PARAMETERS: pa_fname type zfirstname01,
            pa_lname type zlastname01,
            pa_activ type zassets01,
            pa_liabs type zliabilities01.

data gv_result type zassets01.
data gv_string type string.
"gv_string = pa_fname && ` ` && pa_lname.
CONCATENATE pa_fname pa_lname into gv_string SEPARATED BY space.

gv_result = pa_activ - pa_liabs.

Write: gv_string, " pa_lname ,
       / 'Ergebnis'(erg), gv_result LEFT-JUSTIFIED.
