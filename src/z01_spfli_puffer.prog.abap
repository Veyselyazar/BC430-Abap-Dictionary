*&---------------------------------------------------------------------*
*& Report Z01_SPFLI_PUFFER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_SPFLI_PUFFER.

PARAMETERS: pa_car type spfli-carrid,
            pa_con type spfli-connid.


data gs_spfli type spfli.

select  * from spfli into gs_spfli
  where carrid = pa_car
    and connid = pa_con.

ENDSELECT.

write: 'Programmende'.
