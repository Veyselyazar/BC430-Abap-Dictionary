*&---------------------------------------------------------------------*
*& Report Z01_SUCHHILFEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_SUCHHILFEN.

*PARAMETERS pa_name type ztab_namen-vorname value check LOWER CASE.
*
*write pa_name.
*PARAMETERS pa_car type zdepment01-carrier.
*PARAMETERS pa_el type ZDEPHEAD01.
*PARAMETERS pa_fe type zdepment01-dephead.
*PARAMETERS pa_PT type zdepment01-vertreter.

PARAMETERS: pa_car type zdepmentt01-carrier default 'AA' ,
            pa_dep2 type zdepmentt01-department DEFAULT 'LMAM' VALUE CHECK.
     "       pa_spra type zdepmentt01-language.
write: pa_car, pa_dep2.



*PARAMETERS: pa_1 type scarr-carrid VALUE CHECK,
*            pa_2 type spfli-carrid VALUE CHECK.
*
*write: pa_1, pa_2.
