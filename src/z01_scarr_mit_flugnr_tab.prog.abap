*&---------------------------------------------------------------------*
*& Report Z01_SCARR_MIT_FLUGNR_TAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_scarr_mit_flugnr_tab MESSAGE-ID bc400.

PARAMETERS pa_car TYPE scarr-carrid.
DATA gs_scarr TYPE zscarr00.
"data gs_spfli like line of gs_scarr-it-spfli.

SELECT SINGLE * FROM scarr
  INTO CORRESPONDING FIELDS OF gs_scarr
  WHERE carrid = pa_car.

CASE sy-subrc.
  WHEN 0.
    SELECT * FROM spfli INTO TABLE gs_scarr-it_spfli
      WHERE carrid = gs_scarr-carrid.
  WHEN 4.
    MESSAGE i041 WITH pa_car.
ENDCASE.


WRITE: /     gs_scarr-carrid,
              gs_scarr-carrname,
              gs_scarr-url(100).
ULINE.

IF lines( gs_scarr-it_spfli ) = 0.
  MESSAGE 'Diese Fluggesellschaft hat keine Flugnummern' TYPE 'S'.
ELSE.
  LOOP AT gs_scarr-it_spfli INTO DATA(gs_spfli).
    WRITE: /15 gs_spfli-carrid,
             gs_spfli-connid,
             gs_spfli-cityfrom,
             gs_spfli-cityto,
             gs_spfli-fltime,
             gs_spfli-deptime,
             gs_spfli-arrtime.
  ENDLOOP.
ENDIF.
