*&---------------------------------------------------------------------*
*& Report ZBC430_01_ITAB_SORTED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbc430_01_itab_sorted.

PARAMETERS pa_car TYPE sflight-carrid.

DATA gs_sflight TYPE sflight.
DATA gt_sflight TYPE zit_sflight01.

SELECT * FROM sflight INTO gs_sflight  up to 40 rows
  WHERE carrid = pa_car
.
  PERFORM ausgabe USING gs_sflight.
ENDSELECT.

ULINE.
WRITE 'Ab hier Daten in sortierter Reihenfolge nach Flugdatum'.
uline.

SELECT * FROM sflight INTO TABLE gt_sflight  up to 40 rows
  WHERE carrid = pa_car
.

LOOP AT gt_sflight INTO gs_sflight.
  PERFORM ausgabe USING gs_sflight.
endloop.

FORM ausgabe USING ps_sflight TYPE sflight.
  WRITE: / ps_sflight-carrid,
           ps_sflight-connid,
           ps_sflight-fldate,
           ps_sflight-price,
           ps_sflight-currency,
           ps_sflight-planetype,
           ps_sflight-seatsmax,
           ps_sflight-seatsocc.
ENDFORM.
