*&---------------------------------------------------------------------*
*& Report Z01_SBOOK_PERFORMANCE_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_sbook_performance_test.
*SELECT * FROM sbook INTO @data(gs_sbook).
*  INSERT zsbook_col FROM gs_sbook.
*  INSERT zsbook_row FROM gs_sbook.
*ENDSELECT.
*WRITE: 'Progende', sy-dbcnt.
DATA gv_summe_loc TYPE p DECIMALS 2.
DATA gs_sbook TYPE sbook.
DATA gt_sbook TYPE TABLE OF sbook.
PARAMETERS pa_db TYPE dd02l-tabname DEFAULT 'ZSBOOK_COL'.

TRY.
    GET RUN TIME FIELD DATA(gv_time).
    SELECT carrid loccuram  FROM (pa_db) INTO CORRESPONDING FIELDS OF  gs_sbook.
      " where carrid = 'AA'
      " ORDER BY loccuram DESCENDING.
      " message 'Datensatz gelesen' type 'I'.
      gv_summe_loc = gv_summe_loc + gs_sbook-loccuram.
    ENDSELECT.

*sort gt_sbook by loccuram DESCENDING.
*LOOP AT gt_sbook INTO gs_sbook.
*  gv_summe_loc = gv_summe_loc + gs_sbook-loccuram.
*ENDLOOP.
    GET RUN TIME FIELD gv_time.
    WRITE: 'Summe', gv_summe_loc, gv_time.
  CATCH cx_root INTO DATA(go_error).
    MESSAGE go_error->get_text( ) TYPE 'I'.
ENDTRY.
