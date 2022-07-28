TYPE-POOL zwko .

TYPES: zwko_vorname  TYPE c LENGTH 10,
       zwko_nachname TYPE c LENGTH 20,
       BEGIN OF zwko_komplex,
         vorname  TYPE zwko_vorname,
         nachname TYPE zwko_nachname,
       END OF zwko_komplex.
