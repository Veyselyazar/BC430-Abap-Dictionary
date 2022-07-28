*&---------------------------------------------------------------------*
*& Report  SAPBC430S_FILL_CLUSTER_TAB                                  *
*&                                                                     *
*&---------------------------------------------------------------------*
*&                                                                     *
*&                                                                     *
*&---------------------------------------------------------------------*

REPORT  Z01SAPBC430S_FILL_CLUSTER_TAB                                  .

DATA gs_scarr  TYPE scarr.
DATA gs_spfli  TYPE spfli.
DATA gs_flight TYPE sflight.

DATA my_error TYPE i VALUE 0.


START-OF-SELECTION.

* Replace # by Your user-number and remove all * from here

 DELETE FROM zcarr01.
*  DELETE FROM zpfli#.
*  DELETE FROM zflight#.
*
*
  "SELECT * FROM scarr INTO gs_scarr.
    "INSERT INTO zcarr01 VALUES gs_scarr.
    INSERT  zcarr01 from ( select * from scarr ) .
  "ENDSELECT.
*
  IF sy-subrc = 0.
    SELECT * FROM spfli INTO gs_spfli.
      INSERT INTO zpfli01 VALUES gs_spfli.
    ENDSELECT.
*
    IF sy-subrc = 0.
*
      SELECT * FROM sflight INTO gs_flight.
        INSERT INTO zflight01 VALUES gs_flight.
      ENDSELECT.
      IF sy-subrc <> 0.
        my_error = 1.
      ENDIF.
    ELSE.
      my_error = 2.
    ENDIF.
  ELSE.
    my_error = 3.
  ENDIF.
*
  IF my_error = 0.
    WRITE / 'Data transport successfully finished'.
  ELSE.
    WRITE: / 'ERROR:', my_error.
  ENDIF.
