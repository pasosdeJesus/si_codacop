Cor1440::Application.config.relative_url_root = 
  ENV.fetch('RUTA_RELATIVA', '/codacop/si')
Cor1440::Application.config.assets.prefix = 
  ENV.fetch('RUTA_RELATIVA', '/codacop/si') + '/assets'
