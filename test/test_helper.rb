ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  fixtures :all

  protected
  def load_seeds
    load "#{Rails.root}/db/seeds.rb"
  end
end


PRUEBA_PERSONA= {
  nombres: "Nombres",
  apellidos: "Apellidos",

  anionac: 1980,
  mesnac: 2,
  dianac: 2,
  sexo: "M",
  numerodocumento: "1061000000",
}


PRUEBA_USUARIO_OP = {
  nusuario: "operador",
  password: "sjrcol123",
  nombre: "operador",
  descripcion: "operador",
  rol: 5,
  idioma: "es_CO",
  email: "operador@localhost",
  encrypted_password: '$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G',
  sign_in_count: 0,
  fechacreacion: "2021-08-27",
  fechadeshabilitacion: nil
}

