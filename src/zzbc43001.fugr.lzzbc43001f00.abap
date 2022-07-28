*---------------------------------------------------------------------*
*    view related FORM routines
*---------------------------------------------------------------------*
*...processing: ZPARTNER01......................................*
FORM GET_DATA_ZPARTNER01.
  PERFORM VIM_FILL_WHERETAB.
*.read data from database.............................................*
  REFRESH TOTAL.
  CLEAR   TOTAL.
  SELECT * FROM SBUSPART WHERE
(VIM_WHERETAB) .
    CLEAR ZPARTNER01 .
ZPARTNER01-MANDANT =
SBUSPART-MANDANT .
ZPARTNER01-BUSPARTNUM =
SBUSPART-BUSPARTNUM .
ZPARTNER01-CONTACT =
SBUSPART-CONTACT .
ZPARTNER01-CONTPHONO =
SBUSPART-CONTPHONO .
ZPARTNER01-BUSPATYP =
SBUSPART-BUSPATYP .
    SELECT SINGLE * FROM STRAVELAG WHERE
AGENCYNUM = SBUSPART-BUSPARTNUM .
    IF SY-SUBRC EQ 0.
ZPARTNER01-AGENCYNUM =
STRAVELAG-AGENCYNUM .
ZPARTNER01-NAME =
STRAVELAG-NAME .
ZPARTNER01-STREET =
STRAVELAG-STREET .
ZPARTNER01-POSTBOX =
STRAVELAG-POSTBOX .
ZPARTNER01-POSTCODE =
STRAVELAG-POSTCODE .
ZPARTNER01-CITY =
STRAVELAG-CITY .
ZPARTNER01-COUNTRY =
STRAVELAG-COUNTRY .
ZPARTNER01-REGION =
STRAVELAG-REGION .
ZPARTNER01-TELEPHONE =
STRAVELAG-TELEPHONE .
    ENDIF.
<VIM_TOTAL_STRUC> = ZPARTNER01.
    APPEND TOTAL.
  ENDSELECT.
  SORT TOTAL BY <VIM_XTOTAL_KEY>.
  <STATUS>-ALR_SORTED = 'R'.
*.check dynamic selectoptions (not in DDIC)...........................*
  IF X_HEADER-SELECTION NE SPACE.
    PERFORM CHECK_DYNAMIC_SELECT_OPTIONS.
  ELSEIF X_HEADER-DELMDTFLAG NE SPACE.
    PERFORM BUILD_MAINKEY_TAB.
  ENDIF.
  REFRESH EXTRACT.
ENDFORM.
*---------------------------------------------------------------------*
FORM DB_UPD_ZPARTNER01 .
*.process data base updates/inserts/deletes.........................*
LOOP AT TOTAL.
  CHECK <ACTION> NE ORIGINAL.
MOVE <VIM_TOTAL_STRUC> TO ZPARTNER01.
  IF <ACTION> = UPDATE_GELOESCHT.
    <ACTION> = GELOESCHT.
  ENDIF.
  CASE <ACTION>.
   WHEN NEUER_GELOESCHT.
IF STATUS_ZPARTNER01-ST_DELETE EQ GELOESCHT.
     READ TABLE EXTRACT WITH KEY <VIM_XTOTAL_KEY>.
     IF SY-SUBRC EQ 0.
       DELETE EXTRACT INDEX SY-TABIX.
     ENDIF.
    ENDIF.
    DELETE TOTAL.
    IF X_HEADER-DELMDTFLAG NE SPACE.
      PERFORM DELETE_FROM_MAINKEY_TAB.
    ENDIF.
   WHEN GELOESCHT.
  SELECT SINGLE FOR UPDATE * FROM SBUSPART WHERE
  BUSPARTNUM = ZPARTNER01-BUSPARTNUM .
    IF SY-SUBRC = 0.
    DELETE SBUSPART .
    ENDIF.
    SELECT SINGLE FOR UPDATE * FROM STRAVELAG WHERE
    AGENCYNUM = SBUSPART-BUSPARTNUM .
    IF SY-SUBRC = 0.
    DELETE STRAVELAG .
    ENDIF.
    IF STATUS-DELETE EQ GELOESCHT.
      READ TABLE EXTRACT WITH KEY <VIM_XTOTAL_KEY> BINARY SEARCH.
      DELETE EXTRACT INDEX SY-TABIX.
    ENDIF.
    DELETE TOTAL.
    IF X_HEADER-DELMDTFLAG NE SPACE.
      PERFORM DELETE_FROM_MAINKEY_TAB.
    ENDIF.
   WHEN OTHERS.
  SELECT SINGLE FOR UPDATE * FROM SBUSPART WHERE
  BUSPARTNUM = ZPARTNER01-BUSPARTNUM .
    IF SY-SUBRC <> 0.   "insert preprocessing: init WA
      CLEAR SBUSPART.
    ENDIF.
SBUSPART-MANDANT =
ZPARTNER01-MANDANT .
SBUSPART-BUSPARTNUM =
ZPARTNER01-BUSPARTNUM .
SBUSPART-CONTACT =
ZPARTNER01-CONTACT .
SBUSPART-CONTPHONO =
ZPARTNER01-CONTPHONO .
SBUSPART-BUSPATYP =
ZPARTNER01-BUSPATYP .
    IF SY-SUBRC = 0.
    UPDATE SBUSPART ##WARN_OK.
    ELSE.
    INSERT SBUSPART .
    ENDIF.
    SELECT SINGLE FOR UPDATE * FROM STRAVELAG WHERE
    AGENCYNUM = SBUSPART-BUSPARTNUM .
      IF SY-SUBRC <> 0.   "insert preprocessing: init WA
        CLEAR STRAVELAG.
STRAVELAG-AGENCYNUM =
SBUSPART-BUSPARTNUM .
      ENDIF.
STRAVELAG-AGENCYNUM =
ZPARTNER01-AGENCYNUM .
STRAVELAG-NAME =
ZPARTNER01-NAME .
STRAVELAG-STREET =
ZPARTNER01-STREET .
STRAVELAG-POSTBOX =
ZPARTNER01-POSTBOX .
STRAVELAG-POSTCODE =
ZPARTNER01-POSTCODE .
STRAVELAG-CITY =
ZPARTNER01-CITY .
STRAVELAG-COUNTRY =
ZPARTNER01-COUNTRY .
STRAVELAG-REGION =
ZPARTNER01-REGION .
STRAVELAG-TELEPHONE =
ZPARTNER01-TELEPHONE .
    IF SY-SUBRC = 0.
    UPDATE STRAVELAG ##WARN_OK.
    ELSE.
    INSERT STRAVELAG .
    ENDIF.
    READ TABLE EXTRACT WITH KEY <VIM_XTOTAL_KEY>.
    IF SY-SUBRC EQ 0.
      <XACT> = ORIGINAL.
      MODIFY EXTRACT INDEX SY-TABIX.
    ENDIF.
    <ACTION> = ORIGINAL.
    MODIFY TOTAL.
  ENDCASE.
ENDLOOP.
CLEAR: STATUS_ZPARTNER01-UPD_FLAG,
STATUS_ZPARTNER01-UPD_CHECKD.
MESSAGE S018(SV).
ENDFORM.
*---------------------------------------------------------------------*
FORM READ_SINGLE_ENTRY_ZPARTNER01.
  SELECT SINGLE * FROM SBUSPART WHERE
BUSPARTNUM = ZPARTNER01-BUSPARTNUM .
ZPARTNER01-MANDANT =
SBUSPART-MANDANT .
ZPARTNER01-BUSPARTNUM =
SBUSPART-BUSPARTNUM .
ZPARTNER01-CONTACT =
SBUSPART-CONTACT .
ZPARTNER01-CONTPHONO =
SBUSPART-CONTPHONO .
ZPARTNER01-BUSPATYP =
SBUSPART-BUSPATYP .
    SELECT SINGLE * FROM STRAVELAG WHERE
AGENCYNUM = SBUSPART-BUSPARTNUM .
    IF SY-SUBRC EQ 0.
ZPARTNER01-AGENCYNUM =
STRAVELAG-AGENCYNUM .
ZPARTNER01-NAME =
STRAVELAG-NAME .
ZPARTNER01-STREET =
STRAVELAG-STREET .
ZPARTNER01-POSTBOX =
STRAVELAG-POSTBOX .
ZPARTNER01-POSTCODE =
STRAVELAG-POSTCODE .
ZPARTNER01-CITY =
STRAVELAG-CITY .
ZPARTNER01-COUNTRY =
STRAVELAG-COUNTRY .
ZPARTNER01-REGION =
STRAVELAG-REGION .
ZPARTNER01-TELEPHONE =
STRAVELAG-TELEPHONE .
    ELSE.
      CLEAR SY-SUBRC.
      CLEAR ZPARTNER01-AGENCYNUM .
      CLEAR ZPARTNER01-NAME .
      CLEAR ZPARTNER01-STREET .
      CLEAR ZPARTNER01-POSTBOX .
      CLEAR ZPARTNER01-POSTCODE .
      CLEAR ZPARTNER01-CITY .
      CLEAR ZPARTNER01-COUNTRY .
      CLEAR ZPARTNER01-REGION .
      CLEAR ZPARTNER01-TELEPHONE .
    ENDIF.
ENDFORM.
*---------------------------------------------------------------------*
FORM CORR_MAINT_ZPARTNER01 USING VALUE(CM_ACTION) RC.
  DATA: RETCODE LIKE SY-SUBRC, COUNT TYPE I, TRSP_KEYLEN TYPE SYFLENG.
  FIELD-SYMBOLS: <TAB_KEY_X> TYPE X.
  CLEAR RC.
MOVE ZPARTNER01-BUSPARTNUM TO
SBUSPART-BUSPARTNUM .
MOVE ZPARTNER01-MANDANT TO
SBUSPART-MANDANT .
  CORR_KEYTAB             =  E071K.
  CORR_KEYTAB-OBJNAME     = 'SBUSPART'.
  IF NOT <vim_corr_keyx> IS ASSIGNED.
    ASSIGN CORR_KEYTAB-TABKEY TO <vim_corr_keyx> CASTING.
  ENDIF.
  ASSIGN SBUSPART TO <TAB_KEY_X> CASTING.
  PERFORM VIM_GET_TRSPKEYLEN
    USING 'SBUSPART'
    CHANGING TRSP_KEYLEN.
  <VIM_CORR_KEYX>(TRSP_KEYLEN) = <TAB_KEY_X>(TRSP_KEYLEN).
  PERFORM UPDATE_CORR_KEYTAB USING CM_ACTION RETCODE.
  ADD: RETCODE TO RC, 1 TO COUNT.
  IF RC LT COUNT AND CM_ACTION NE PRUEFEN.
    CLEAR RC.
  ENDIF.

MOVE SBUSPART-BUSPARTNUM TO
STRAVELAG-AGENCYNUM .
MOVE ZPARTNER01-MANDANT TO
STRAVELAG-MANDT .
  CORR_KEYTAB             =  E071K.
  CORR_KEYTAB-OBJNAME     = 'STRAVELAG'.
  IF NOT <vim_corr_keyx> IS ASSIGNED.
    ASSIGN CORR_KEYTAB-TABKEY TO <vim_corr_keyx> CASTING.
  ENDIF.
  ASSIGN STRAVELAG TO <TAB_KEY_X> CASTING.
  PERFORM VIM_GET_TRSPKEYLEN
    USING 'STRAVELAG'
    CHANGING TRSP_KEYLEN.
  <VIM_CORR_KEYX>(TRSP_KEYLEN) = <TAB_KEY_X>(TRSP_KEYLEN).
  PERFORM UPDATE_CORR_KEYTAB USING CM_ACTION RETCODE.
  ADD: RETCODE TO RC, 1 TO COUNT.
  IF RC LT COUNT AND CM_ACTION NE PRUEFEN.
    CLEAR RC.
  ENDIF.

ENDFORM.
*---------------------------------------------------------------------*
