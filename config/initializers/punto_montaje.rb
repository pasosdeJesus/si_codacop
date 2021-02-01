Cor1440::Application.config.relative_url_root = 
  ENV['RUTA_RELATIVA'] || '/cor1440'
Cor1440::Application.config.assets.prefix = 
  (ENV['RUTA_RELATIVA'] || '/cor1440') + '/assets'
