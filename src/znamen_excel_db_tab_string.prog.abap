*&---------------------------------------------------------------------*
*& Report ZNAMEN_EXCEL_DB_TAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znamen_excel_db_tab_string.
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
data gv_dateiname type string .
gv_dateiname = gv_filename.
data gt_daten type TABLE OF string.
CALL FUNCTION 'GUI_UPLOAD'
  EXPORTING
    filename                      = gv_dateiname
*   FILETYPE                      = 'ASC'
*   HAS_FIELD_SEPARATOR           = ' '
*   HEADER_LENGTH                 = 0
*   READ_BY_LINE                  = 'X'
*   DAT_MODE                      = ' '
*   CODEPAGE                      = ' '
*   IGNORE_CERR                   = ABAP_TRUE
*   REPLACEMENT                   = '#'
*   CHECK_BOM                     = ' '
*   VIRUS_SCAN_PROFILE            =
*   NO_AUTH_CHECK                 = ' '
* IMPORTING
*   FILELENGTH                    =
*   HEADER                        =
  tables
    data_tab                      = gt_daten
* CHANGING
*   ISSCANPERFORMED               = ' '
* EXCEPTIONS
*   FILE_OPEN_ERROR               = 1
*   FILE_READ_ERROR               = 2
*   NO_BATCH                      = 3
*   GUI_REFUSE_FILETRANSFER       = 4
*   INVALID_TYPE                  = 5
*   NO_AUTHORITY                  = 6
*   UNKNOWN_ERROR                 = 7
*   BAD_DATA_FORMAT               = 8
*   HEADER_NOT_ALLOWED            = 9
*   SEPARATOR_NOT_ALLOWED         = 10
*   HEADER_TOO_LONG               = 11
*   UNKNOWN_DP_ERROR              = 12
*   ACCESS_DENIED                 = 13
*   DP_OUT_OF_MEMORY              = 14
*   DISK_FULL                     = 15
*   DP_TIMEOUT                    = 16
*   OTHERS                        = 17
          .

BREAK-POINT.
