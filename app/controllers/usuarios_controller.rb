require 'cor1440_gen/concerns/controllers/usuarios_controller'

class UsuariosController < Msip::ModelosController
  include Cor1440Gen::Concerns::Controllers::UsuariosController

  # Sin definición de autorización por ser requerida por no autenticados
  
  def atributos_index
    [ "id",
      "nusuario",
      "nombre",
      "email",
      "grupo_ids",
      "habilitado",
    ]
  end

  def atributos_form
    r = []
    if can?(:create, ::Usuario)
      r += [ 
        "nusuario",
        "nombre",
        "descripcion"
      ]
    end
    if can?(:manage, ::Usuario)
      r += ["rol"]
    end
    if can?(:create, ::Usuario)
      r += [
        "email",
        "tema",
        "msip_grupo",
        "fechacreacion_localizada",
        "fechadeshabilitacion_localizada",
      ]
    end
    if can?(:manage, ::Usuario)
      r += [
        "idioma",
        "encrypted_password",
        "failed_attempts",
        "unlock_token",
        "locked_at"
      ]
    end
    return r
  end

  def atributos_show
    r = []
    if can?(:read, ::Usuario)
      r += [ 
        "nusuario",
        "id",
        "nombre",
        "grupos",
        "email",
      ]
    end
    if can?(:manage, ::Usuario)
      r += [
        "rol",
        "idioma",
        "encrypted_password",
        "fechacreacion_localizada",
        "fechadeshabilitacion_localizada",
        "failed_attempts",
        "unlock_token",
        "locked_at"
      ]
    end
    return r
  end
 
  def atributos_show_json
    atributos_show 
  end

  def index_reordenar(c)
    if !params || !params[:filtro] || !params[:filtro][:bushabilitado]
      c = c.where("usuario.fechadeshabilitacion IS NULL")
    end
    c = c.reorder([:nombre])
    return c
  end

end

