# encoding: UTF-8
class Ability  < Cor1440Gen::Ability

  def tablasbasicas 
    Sip::Ability::BASICAS_PROPIAS + BASICAS_PROPIAS - [
      ['Sip', 'fuenteprensa'], 
      ['Sip', 'oficina'], 
      ['Cor1440Gen', 'proyecto'], 
      ['Sip', 'tdocumento'], 
      ['Sip', 'trelacion'], 
      ['Sip', 'tsitio']
    ]
  end

  # Autorizacion con CanCanCan
  def initialize(usuario = nil)
    initialize_cor1440_gen(usuario)
    cannot :read, Sip::Oficina
    if !usuario || usuario.fechadeshabilitacion || !usuario.rol
      return
    end
  end # initialize

end

