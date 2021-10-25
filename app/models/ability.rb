class Ability  < Cor1440Gen::Ability

  ROLES_CA = [
    'Administrar todos los proyectos. ' +
    'Administrar todas las actividades. ' +
    'Administrar usuarios. ' + 
    'Administrar documentos en nube. ' +
    'Administrar tablas básicas. ', #ROLADMIN

    '', # 2

    'Las mismas del administradorconteos de casos. ', #ROLDIR
 
    '', # 4

    'Ver proyectos y administrar aquellos de los que es responsable. ' +
    'Administrar actividades de proyectos institucionales y en los que está en el equipo de trabajo. ' +
    'Ver documentos en nube. ', # ROLOPERADOR

    '', # 6
    '' # 7
  ]

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

