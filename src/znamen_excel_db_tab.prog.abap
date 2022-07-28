*&---------------------------------------------------------------------*
*& Report ZNAMEN_EXCEL_DB_TAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znamen_excel_db_tab.
DATA gt_filetable TYPE filetable.
DATA gv_anz_files TYPE i.
DATA gt_namen TYPE TABLE OF alsmex_tabline.
DATA gs_name TYPE alsmex_tabline.
DATA gs_tab_name TYPE ztab_namen.
cl_gui_frontend_services=>file_open_dialog(

  CHANGING
    file_table              =  gt_filetable   " Tabelle, die selektierte Dateien enthält
    rc                      =  gv_anz_files   " Rückgabewert: Anzahl Dateien oder -1 falls Fehler auftritt
*    user_action             =     " Benutzeraktion( s. Kl.konstanten ACTION_OK, ACTION_CANCEL)
*    file_encoding           =
  EXCEPTIONS
    file_open_dialog_failed = 1
    cntl_error              = 2
    error_no_gui            = 3
    not_supported_by_gui    = 4
    OTHERS                  = 5
).

IF sy-subrc <> 0.
  MESSAGE 'Fehler bei Dateiauswahl' TYPE 'I'.
  RETURN.
ENDIF.

DATA gv_filename TYPE rlgrap-filename.
"gs_filename = gt_filetable[ 1 ].
READ TABLE gt_filetable into gv_filename index 1.
CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
  EXPORTING
    filename                = gv_filename
    i_begin_col             = 1
    i_begin_row             = 2
    i_end_col               = 3
    i_end_row               = 100000
  TABLES
    intern                  = gt_namen
  EXCEPTIONS
    inconsistent_parameters = 1
    upload_ole              = 2
    OTHERS                  = 3.
IF sy-subrc <> 0.
  MESSAGE 'Fehler bei Excel-Übernahme' TYPE 'I'.
  RETURN.
ENDIF.

*LOOP AT gt_namen ASSIGNING FIELD-SYMBOL(<fs_name>).
*  IF to_upper( val = <fs_name>-value ) CN sy-abcde.
*    DELETE gt_namen.
*  ELSE.
*    gs_tab_name = <fs_name>-value.
*    INSERT ztab_namen FROM gs_tab_name.
*  ENDIF.
*ENDLOOP.

WRITE: 'Datenübernahme ist in Ordnung', lines( gt_namen ).
