# encoding: UTF-8

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cor1440
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'America/Bogota'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    config.active_record.schema_format = :sql

    config.x.url_colchon = ENV['COLCHON_ARTICULOS'] || 'colchon-articulos'
    puts "OJO application.rb config.x.url_colchon=#{config.x.url_colchon}"

    config.x.formato_fecha = ENV['FORMATO_FECHA'] || 'dd/M/yyyy'
    puts "OJO application.rb config.x.formato_fecha=#{config.x.formato_fecha}"

    config.relative_url_root = ENV['RUTA_RELATIVA'] || "/cor1440"
    puts "OJO application.rb config.x.relative_url_root=#{config.x.relative_url_root}"

    config.x.heb412_ruta = ENV['HEB412_RUTA'] && ENV['HEB412_RUTA'] != '' ?
      Pathname(ENV['HEB412_RUTA']) : Rails.root.join('public', 'heb412')
    puts "OJO application.rb config.x.heb412_ruta=#{config.x.heb412_ruta}"

    config.hosts <<  (ENV['CONFIG_HOSTS'] ? ENV['CONFIG_HOSTS'].downcase : 'nodos.pasosdeJesus.org'.downcase)
    puts "OJO application.rb config.x.config.hosts=#{config.x.config.hosts}"

   end
end
