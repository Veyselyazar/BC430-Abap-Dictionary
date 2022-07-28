*&---------------------------------------------------------------------*
*& Report Z01_CUSTOM_LESEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_custom_lesen.

DATA gs_person TYPE zperson01.
DATA gs_phone LIKE LINE OF gs_person-phone.
DATA gt_personen type zit_personen.
PARAMETERS pa_land TYPE scustom-country.

SELECT name, street, postcode, city, telephone
  FROM scustom
  INTO (@gs_person-name-nachname,
        @gs_person-street,
        @gs_person-zip,
        @gs_person-city,
        @gs_phone-p_number)
  WHERE country = @pa_land.
  IF gs_phone-p_number IS NOT INITIAL.
    INSERT gs_phone INTO TABLE gs_person-phone.
  ENDIF.
  INSERT gs_person INTO TABLE gt_personen.
  CLEAR gs_person.
ENDSELECT.

LOOP AT gt_personen INTO gs_person.
  WRITE: / gs_person-name-nachname,
           gs_person-street,
           gs_person-zip,
           gs_person-city.
  IF gs_person-phone IS NOT INITIAL.
    LOOP AT gs_person-phone INTO gs_phone.
      WRITE: /15 gs_phone.
    ENDLOOP.
  ELSE.
    WRITE: /15 'Keine Telefonnummer'.
  ENDIF.
  ULINE.
ENDLOOP.
