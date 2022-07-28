@AbapCatalog.sqlViewName: 'ZCDS_SPFLI_JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Join Scarr mit Spfli'
define view z01_spfli_join as 
select from scarr as a 
left outer join spfli as b
on a.carrid = b.carrid

{
 key a.carrid,
     a.carrname,
     a.currcode,
     b.connid,
     b.cityfrom,
     b.cityto,
     case b.fltype
     when 'X' then 'Fracht'
     else 'Linie'
     end as lang_text
     
    
}
