@AbapCatalog.sqlViewName: 'ZCDS_99_SFLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sflight mit Parameter Carrid'
define view z01sflight01  
with parameters p_carrid:abap.char( 3 )
as 
select from sflight as s 
{
  key s.carrid,
  key s.connid,
  key s.fldate,
      s.planetype,
      s.seatsocc,
      s.seatsmax  
}
where carrid = $parameters.p_carrid
