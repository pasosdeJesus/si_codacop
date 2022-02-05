require 'test_helper'

module Sip
  class ControlAccesoUsuariosTest < ActionDispatch::IntegrationTest

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @persona = Sip::Persona.create!(PRUEBA_PERSONA)
      @persona2 = Sip::Persona.create!(PRUEBA_PERSONA)
      @operador = ::Usuario.create!(PRUEBA_USUARIO_OP)
      @raiz = Rails.application.config.relative_url_root.delete_suffix('/')
    end

    # No autenticado
    ################

    test "sin autenticar no debe presentar usuarios nuevo" do
      assert_raise CanCan::AccessDenied do
        get "#{@raiz}/usuarios/nuevo"
      end
    end

    test "sin autenticar puede accceder a unlock new" do
      get "#{@raiz}/usuarios/unlock/new"
      assert_response :ok
    end

    test "sin autenticar puede accceder a unlock" do
      get "#{@raiz}/usuarios/unlock"
      assert_response :ok
    end

    test "sin autenticar puede redirige a iniciar sesion en registrar" do
      get "#{@raiz}/usuarios/edit"
      assert_redirected_to "#{@raiz}#{@raiz}/usuarios/sign_in"
    end

    test "sin autenticar no puede acceder a put edit usuario" do
      put "#{@raiz}/usuarios/edit"
      assert_redirected_to "#{@raiz}#{@raiz}/usuarios/sign_in"
    end

    test "sin autenticar no puede acceder a post usuarios" do
      assert_raise CanCan::AccessDenied do
        post "#{@raiz}/usuarios", params: {usuario: {nombre: "ale"}}
      end
    end

    test "sin autenticar no puede acceder a usuarios" do
      get "#{@raiz}/usuarios"
      assert_redirected_to @raiz
    end

    test "sin autenticar no debe mostrar usuarios nuevo" do
      id_usuario = Sip::Usuario.take.id
      assert_raise CanCan::AccessDenied do
        get "#{@raiz}/usuarios/" + id_usuario.to_s
      end
    end

    test "sin autenticar no debe editar usuarios" do
      id_usuario = Sip::Usuario.take.id
      assert_raise CanCan::AccessDenied do
        get "#{@raiz}/usuarios/" + id_usuario.to_s + "/edita"
      end
    end

    test "sin autenticar no debe acceder a eliminar usuarios" do
      id_usuario = Sip::Usuario.take.id
      assert_raise CanCan::AccessDenied do
        delete "#{@raiz}/usuarios/" + id_usuario.to_s
      end
    end

    # Autenticado como operador sin grupo
    #####################################

    test "autenticado como operador sin grupo puede" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      get "#{@raiz}/sign_out"
      assert_redirected_to @raiz
    end

    test "observador de casos puede accceder a unlock new" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      get "#{@raiz}/usuarios/unlock/new"
      assert_redirected_to @raiz
    end

    test "observador de casos puede accceder a unlock" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      get "#{@raiz}/usuarios/unlock"
      assert_redirected_to @raiz
    end

    test "observador puede acceder a editar su usuario" do
      skip
      debugger
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      get "#{@raiz}/usuarios/edit"
      assert_response :ok
    end

    test "observador  puede acceder a put edit su usuario" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      put "#{@raiz}/usuarios/edit"
      assert_response :ok
    end

    test "observador  puede acceder a patch edit su usuario" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      id_usuario = Sip::Usuario.take.id
      assert_raise CanCan::AccessDenied do
        patch "#{@raiz}/usuarios/" + id_usuario.to_s, params: {usuario: {nombre: "ale"}}
      end
    end


    test "observador no puede acceder a usuarios" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      get "#{@raiz}/usuarios"
      assert_redirected_to @raiz
    end

    test "observador no puede acceder a post usuarios" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      assert_raise CanCan::AccessDenied do
        post "#{@raiz}/usuarios", params: {usuario: {nombre: "ale"}}
      end
    end

    test "observador no debe presentar usuarios nuevo" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      assert_raise CanCan::AccessDenied do
        get "#{@raiz}/usuarios/nuevo"
      end
    end

    test "observador no debe mostrar usuarios nuevo" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      id_usuario = Sip::Usuario.take.id
      assert_raise CanCan::AccessDenied do
        get "#{@raiz}/usuarios/" + id_usuario.to_s
      end
    end

    test "observador no debe editar usuarios" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      id_usuario = Sip::Usuario.take.id
      assert_raise CanCan::AccessDenied do
        get "#{@raiz}/usuarios/" + id_usuario.to_s + "/edita"
      end
    end

    test "observador no debe acceder a eliminar usuarios" do
      skip
      current_usuario = ::Usuario.where(nusuario: 'operador')
      sign_in current_usuario
      id_usuario = Sip::Usuario.take.id
      assert_raise CanCan::AccessDenied do
        delete "#{@raiz}/usuarios/" + id_usuario.to_s
      end
    end


  end
end
