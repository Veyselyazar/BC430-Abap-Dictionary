*&---------------------------------------------------------------------*
*& Report Z_KONVERTIERUNGSROUTINE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_KONVERTIERUNGSROUTINE.

PARAMETERS pa_plz type z97_plz value check.
PARAMETERS pa_zeit type s_fltime.

add 60 to pa_zeit.

write pa_zeit.
