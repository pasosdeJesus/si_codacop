class TemaCodacop < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE public.sip_tema SET 
        nombre='INSTITUCIONAL CODACOP',
        fondo = '#ffffff',
        color_fuente = '#000000',
        nav_ini = '#a43c6c',
        nav_fin = '#a43c6c',
        nav_fuente = '#ffffff',
        fondo_lista = '#e6adc7',
        btn_primario_fondo_ini = '#a43c6c',
        btn_primario_fondo_fin = '#a43c6c',
        btn_primario_fuente = '#ffffff',
        btn_peligro_fondo_ini = '#bf1b28',
        btn_peligro_fondo_fin = '#bf1b28',
        btn_peligro_fuente = '#ffffff',
        btn_accion_fondo_ini = '#f2f2ff',
        btn_accion_fondo_fin= '#d6d6f0',
        btn_accion_fuente = '#000000',
        alerta_exito_fondo = '#e6adc7',
        alerta_exito_fuente = '#000000',
        alerta_problema_fondo = '#bf1b28',
        alerta_problema_fuente = '#ffffff',
        color_flota_subitem_fuente = '#266dd3',
        color_flota_subitem_fondo = '#ffffff'

      WHERE id=1;

    INSERT INTO public.sip_tema (id, nombre, observaciones, nav_ini, 
      nav_fin, nav_fuente, fondo_lista, fechacreacion, fechadeshabilitacion, 
      created_at, updated_at, btn_primario_fondo_ini, btn_primario_fondo_fin, 
      btn_primario_fuente, btn_peligro_fondo_ini, btn_peligro_fondo_fin, 
      btn_peligro_fuente, btn_accion_fondo_ini, btn_accion_fondo_fin, 
      btn_accion_fuente, alerta_exito_fondo, alerta_exito_fuente, 
      alerta_problema_fondo, alerta_problema_fuente, fondo, color_fuente, 
      color_flota_subitem_fuente, color_flota_subitem_fondo) VALUES (2, 
      'AZUL POR OMISIÓN', NULL, '#266dd3', '#266dd3', '#ffffff', '#95c4ff', 
      '2019-07-15', NULL, '2019-07-15 00:00:00', '2019-12-06 11:28:40.417106', 
      '#0088cc', '#0044cc', '#ffffff', '#ee5f5b', '#bd362f', '#ffffff', 
      '#ffffff', '#e6e6e6', '#000000', '#dff0d8', '#468847', '#f8d7da', 
      '#721c24', '#ffffff', '#000000', NULL, NULL);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.sip_tema WHERE id=1;
      UPDATE public.sip_tema SET id=1 WHERE id=2;
    SQL
  end
end
