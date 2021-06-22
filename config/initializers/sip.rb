require 'sip/version'

Sip.setup do |config|
  config.ruta_anexos = ENV.fetch('SIP_RUTA_ANEXOS', 
                                 "#{Rails.root}/archivos/anexos")
  config.ruta_volcados = ENV.fetch('SIP_RUTA_VOLCADOS',
                                   "#{Rails.root}/archivos/bd")
  config.titulo = "sip #{Sip::VERSION}"
  config.titulo = "SI CODACOP #{Cor1440Gen::VERSION}"

  # Tema 1
  config.colorom_fondo = '#ffffff'
  config.colorom_color_fuente = '#000000'
  config.colorom_nav_ini = '#a43c6c'
  config.colorom_nav_fin = '#a43c6c'
  config.colorom_nav_fuente = '#ffffff'
  config.colorom_fondo_lista = '#e6adc7'
  config.colorom_btn_primario_fondo_ini = '#a43c6c'
  config.colorom_btn_primario_fondo_fin = '#a43c6c'
  config.colorom_btn_primario_fuente = '#ffffff'
  config.colorom_btn_peligro_fondo_ini = '#bf1b28'
  config.colorom_btn_peligro_fondo_fin = '#bf1b28'
  config.colorom_btn_peligro_fuente = '#ffffff'
  config.colorom_btn_accion_fondo_ini = '#f2f2ff'
  config.colorom_btn_accion_fondo_fin= '#d6d6f0'
  config.colorom_btn_accion_fuente = '#000000'
  config.colorom_alerta_exito_fondo = '#e6adc7'
  config.colorom_alerta_exito_fuente = '#000000'
  config.colorom_alerta_problema_fondo = '#bf1b28'
  config.colorom_alerta_problema_fuente = '#ffffff'
  config.colorom_color_flota_subitem_fuente = '#e6adc7'
  config.colorom_color_flota_subitem_fondo = '#a43c6c'

  Cor1440Gen.actividadg5 = "Externos diversos"
end
