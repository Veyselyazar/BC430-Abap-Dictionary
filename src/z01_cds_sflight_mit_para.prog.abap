*&---------------------------------------------------------------------*
*& Report z01_cds_sflight_mit_para
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_cds_sflight_mit_para.

data: go_alv type REF TO cl_salv_table,
      go_functions type REF TO cl_salv_functions.
PARAMETERS pa_car type sflight-carrid DEFAULT 'AA'.

select * from ZCDS_99_SFLIGHT(  p_carrid = @pa_car )
 into table @data(gt_sflight).

cl_salv_table=>factory(
  IMPORTING r_salv_table = go_alv
  CHANGING t_table = gt_sflight ).

go_functions = go_alv->get_functions(  ).
go_functions->set_all( ).
go_alv->display(  ).
