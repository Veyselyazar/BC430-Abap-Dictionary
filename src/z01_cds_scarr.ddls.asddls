@AbapCatalog.sqlViewName: 'ZDS_01_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Selektion scarr-Daten'
define view z01_cds_scarr as select 
from zcarr01 as a
{
  key a.carrid,
      a.carrname,
      a.currcode,
      a.url 
}
where a.currcode = 'EUR'
